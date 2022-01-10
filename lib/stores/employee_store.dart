

import 'package:mobx/mobx.dart';
import 'package:mobx_emp_manager/data/local/database_helper.dart';
import 'package:mobx_emp_manager/data/repository.dart';
import 'package:mobx_emp_manager/models/employees.dart';
part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;
abstract class _EmployeeStore with Store {
  final FormErrorState error = FormErrorState();

  // _EmployeeStore(Repository repository) : this._repository = repository;
  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  @observable
  String name = '';

  @observable
  int age = 0;

  @observable
  String position = '';

  @observable
  String phone = '';

  @observable
  String address = '';

  @observable
  int isRetired = 0;

  @observable
  String createAt = '';

  @observable
  Employees employee = Employees();

  @observable
  ObservableFuture<bool> empNameCheck = ObservableFuture.value(true);

  @observable
  ObservableFuture<int> checkInsertEmp = ObservableFuture.value(0);

  @observable
  ObservableFuture<int> checkDelEmp = ObservableFuture.value(0);

  /// get employees
  static ObservableFuture<List<Employees>> emptyEmpResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<List<Employees>> fetchEmpFuture =
  ObservableFuture<List<Employees>>(emptyEmpResponse);

  @observable
  List<Employees> empList;

  /// list emp is retired
  @observable
  ObservableFuture<List<Employees>> fetchEmpRetiredFuture =
  ObservableFuture<List<Employees>>(emptyEmpResponse);

  @observable
  List<Employees> empRetiredList;

  @observable
  Employees empCanAddorUpdate;


  @computed
  int  get getAge => age;
  @computed
  String  get getPosition => position;
  @computed
  String  get getAddress => address;

  @computed
  String  get getCreateAt => createAt;

  @computed
  bool get loading => fetchEmpFuture.status == FutureStatus.pending;

  @computed
  bool get isUserCheckPending => empNameCheck.status == FutureStatus.pending;

  @computed
  bool get canAddEmp => !error.hasErrors;

  @computed
  Employees get getEmpCanAddOrUpdate => empCanAddorUpdate = Employees(
    name: name,
    phone: phone,
    position: position,
    age: age,
    isRetired: isRetired,
    createdAt: DateTime.now().microsecondsSinceEpoch.toString()
  );

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateName),
      reaction((_) => phone, validatePhone)
    ];
  }

  @action
  void setNameEmp(String value) {
    name = value;
  }

  @action
  void setAge(int value) {
    age = value;
  }

  @action
  void setPosition(String value) {
    position = value;
  }

  @action
  void setAddress(String value) {
    address = value;
  }

  @action
  // ignore: avoid_void_async
  void validateName(String value) {
    error.name = value == null || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validatePhone(String value) {
    error.phone = value == null || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  initNewEmployee() {
    empCanAddorUpdate = null;
    if(empCanAddorUpdate == null) {
      var bool = empCanAddorUpdate == Employees(
          isRetired: 0,
          createdAt: DateTime.now().microsecondsSinceEpoch.toString()
      );
    }
  }


  /// get data emp from local
  @action
  Future getEmployees() async {
    var db = new DatabaseHelper();
    final future = db.getEmployees();
    fetchEmpFuture = ObservableFuture(future);

    future.then((empList) {
      this.empList = empList.where((element) => element.isRetired == 0).toList();
      this.empRetiredList = empList.where((element) => element.isRetired == 1 && !isValid2DelRetiredEmp(element)).toList();
    }).catchError((error) {
      errorStore.errorMessage = "Can not get employees";
    });
  }

  /// insert emp to local
  @action
  Future insertEmpLocal() async {
    var db = new DatabaseHelper();
    final future = db.insertEmpLocal(getEmpCanAddOrUpdate);
    checkInsertEmp = ObservableFuture(future);
    future.then((check) {
      print("####: "+  check.toString());
    }).catchError((error) {
      errorStore.errorMessage = "Can not add new employee";
      print("#####: Can not add new employee");
    });
    this.getEmployees();
  }

  @action
  Future moveEmployee2RetiredList(Employees employee) async {
    var db = new DatabaseHelper();
    Employees retiredEmp = Employees();
    retiredEmp = employee;
    retiredEmp.isRetired = 1;
    retiredEmp.dateRetired = DateTime.now().microsecondsSinceEpoch.toString();
    final future = db.updateEmpById(retiredEmp);
    checkDelEmp = ObservableFuture(future);
    future.then((check) {
      print("####: "+  check.toString());
    }).catchError((error) {
      errorStore.errorMessage = "Can not add new employee";
      print("#####: Can not update an employee");
    });
    this.getEmployees();
  }


  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePhone(phone);
    validateName(name);
  }

  /// After 5 days from retired time -- retired emp will be deleted
  bool isValid2DelRetiredEmp(Employees emp) {
    DateTime dateTime = DateTime.now();
    DateTime dateRetired = DateTime.fromMicrosecondsSinceEpoch(int.parse(emp.dateRetired));
    if(dateTime.difference(dateRetired).inDays == 5) {
      return true;
    }
    return false;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String name;


  @observable
  String phone;

  @computed
  bool get hasErrors => name != null ||  phone != null;
}

class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {

  // disposers
  List<ReactionDisposer> _disposers;

  _ErrorStore() {
    _disposers = [
      reaction((_) => errorMessage, reset, delay: 200),
    ];
  }

  @observable
  String errorMessage = '';


  @action
  void setErrorMessage(String message) {
    this.errorMessage = message;
  }

  @action
  void reset(String value) {
    print('calling reset');
    errorMessage = '';
  }

  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}