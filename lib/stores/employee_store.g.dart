
part of 'employee_store.dart';

mixin _$EmployeeStore on _EmployeeStore, Store {
  Computed<int> _$getAgeComputed;

  @override
  int get getAge => (_$getAgeComputed ??=
          Computed<int>(() => super.getAge, name: '_EmployeeStore.getAge'))
      .value;
  Computed<String> _$getPositionComputed;

  @override
  String get getPosition =>
      (_$getPositionComputed ??= Computed<String>(() => super.getPosition,
              name: '_EmployeeStore.getPosition'))
          .value;
  Computed<String> _$getAddressComputed;

  @override
  String get getAddress =>
      (_$getAddressComputed ??= Computed<String>(() => super.getAddress,
              name: '_EmployeeStore.getAddress'))
          .value;
  Computed<String> _$getCreateAtComputed;

  @override
  String get getCreateAt =>
      (_$getCreateAtComputed ??= Computed<String>(() => super.getCreateAt,
              name: '_EmployeeStore.getCreateAt'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_EmployeeStore.loading'))
      .value;
  Computed<bool> _$isUserCheckPendingComputed;

  @override
  bool get isUserCheckPending => (_$isUserCheckPendingComputed ??=
          Computed<bool>(() => super.isUserCheckPending,
              name: '_EmployeeStore.isUserCheckPending'))
      .value;
  Computed<bool> _$canAddEmpComputed;

  @override
  bool get canAddEmp =>
      (_$canAddEmpComputed ??= Computed<bool>(() => super.canAddEmp,
              name: '_EmployeeStore.canAddEmp'))
          .value;
  Computed<Employees> _$getEmpCanAddOrUpdateComputed;

  @override
  Employees get getEmpCanAddOrUpdate => (_$getEmpCanAddOrUpdateComputed ??=
          Computed<Employees>(() => super.getEmpCanAddOrUpdate,
              name: '_EmployeeStore.getEmpCanAddOrUpdate'))
      .value;

  final _$nameAtom = Atom(name: '_EmployeeStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$ageAtom = Atom(name: '_EmployeeStore.age');

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  final _$positionAtom = Atom(name: '_EmployeeStore.position');

  @override
  String get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(String value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$phoneAtom = Atom(name: '_EmployeeStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$addressAtom = Atom(name: '_EmployeeStore.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$isRetiredAtom = Atom(name: '_EmployeeStore.isRetired');

  @override
  int get isRetired {
    _$isRetiredAtom.reportRead();
    return super.isRetired;
  }

  @override
  set isRetired(int value) {
    _$isRetiredAtom.reportWrite(value, super.isRetired, () {
      super.isRetired = value;
    });
  }

  final _$createAtAtom = Atom(name: '_EmployeeStore.createAt');

  @override
  String get createAt {
    _$createAtAtom.reportRead();
    return super.createAt;
  }

  @override
  set createAt(String value) {
    _$createAtAtom.reportWrite(value, super.createAt, () {
      super.createAt = value;
    });
  }

  final _$employeeAtom = Atom(name: '_EmployeeStore.employee');

  @override
  Employees get employee {
    _$employeeAtom.reportRead();
    return super.employee;
  }

  @override
  set employee(Employees value) {
    _$employeeAtom.reportWrite(value, super.employee, () {
      super.employee = value;
    });
  }

  final _$empNameCheckAtom = Atom(name: '_EmployeeStore.empNameCheck');

  @override
  ObservableFuture<bool> get empNameCheck {
    _$empNameCheckAtom.reportRead();
    return super.empNameCheck;
  }

  @override
  set empNameCheck(ObservableFuture<bool> value) {
    _$empNameCheckAtom.reportWrite(value, super.empNameCheck, () {
      super.empNameCheck = value;
    });
  }

  final _$checkInsertEmpAtom = Atom(name: '_EmployeeStore.checkInsertEmp');

  @override
  ObservableFuture<int> get checkInsertEmp {
    _$checkInsertEmpAtom.reportRead();
    return super.checkInsertEmp;
  }

  @override
  set checkInsertEmp(ObservableFuture<int> value) {
    _$checkInsertEmpAtom.reportWrite(value, super.checkInsertEmp, () {
      super.checkInsertEmp = value;
    });
  }

  final _$checkDelEmpAtom = Atom(name: '_EmployeeStore.checkDelEmp');

  @override
  ObservableFuture<int> get checkDelEmp {
    _$checkDelEmpAtom.reportRead();
    return super.checkDelEmp;
  }

  @override
  set checkDelEmp(ObservableFuture<int> value) {
    _$checkDelEmpAtom.reportWrite(value, super.checkDelEmp, () {
      super.checkDelEmp = value;
    });
  }

  final _$fetchEmpFutureAtom = Atom(name: '_EmployeeStore.fetchEmpFuture');

  @override
  ObservableFuture<List<Employees>> get fetchEmpFuture {
    _$fetchEmpFutureAtom.reportRead();
    return super.fetchEmpFuture;
  }

  @override
  set fetchEmpFuture(ObservableFuture<List<Employees>> value) {
    _$fetchEmpFutureAtom.reportWrite(value, super.fetchEmpFuture, () {
      super.fetchEmpFuture = value;
    });
  }

  final _$empListAtom = Atom(name: '_EmployeeStore.empList');

  @override
  List<Employees> get empList {
    _$empListAtom.reportRead();
    return super.empList;
  }

  @override
  set empList(List<Employees> value) {
    _$empListAtom.reportWrite(value, super.empList, () {
      super.empList = value;
    });
  }

  final _$fetchEmpRetiredFutureAtom =
      Atom(name: '_EmployeeStore.fetchEmpRetiredFuture');

  @override
  ObservableFuture<List<Employees>> get fetchEmpRetiredFuture {
    _$fetchEmpRetiredFutureAtom.reportRead();
    return super.fetchEmpRetiredFuture;
  }

  @override
  set fetchEmpRetiredFuture(ObservableFuture<List<Employees>> value) {
    _$fetchEmpRetiredFutureAtom.reportWrite(value, super.fetchEmpRetiredFuture,
        () {
      super.fetchEmpRetiredFuture = value;
    });
  }

  final _$empRetiredListAtom = Atom(name: '_EmployeeStore.empRetiredList');

  @override
  List<Employees> get empRetiredList {
    _$empRetiredListAtom.reportRead();
    return super.empRetiredList;
  }

  @override
  set empRetiredList(List<Employees> value) {
    _$empRetiredListAtom.reportWrite(value, super.empRetiredList, () {
      super.empRetiredList = value;
    });
  }

  final _$empCanAddorUpdateAtom =
      Atom(name: '_EmployeeStore.empCanAddorUpdate');

  @override
  Employees get empCanAddorUpdate {
    _$empCanAddorUpdateAtom.reportRead();
    return super.empCanAddorUpdate;
  }

  @override
  set empCanAddorUpdate(Employees value) {
    _$empCanAddorUpdateAtom.reportWrite(value, super.empCanAddorUpdate, () {
      super.empCanAddorUpdate = value;
    });
  }

  final _$getEmployeesAsyncAction = AsyncAction('_EmployeeStore.getEmployees');

  @override
  Future<dynamic> getEmployees() {
    return _$getEmployeesAsyncAction.run(() => super.getEmployees());
  }

  final _$insertEmpLocalAsyncAction =
      AsyncAction('_EmployeeStore.insertEmpLocal');

  @override
  Future<dynamic> insertEmpLocal() {
    return _$insertEmpLocalAsyncAction.run(() => super.insertEmpLocal());
  }

  final _$moveEmployee2RetiredListAsyncAction =
      AsyncAction('_EmployeeStore.moveEmployee2RetiredList');

  @override
  Future<dynamic> moveEmployee2RetiredList(Employees employee) {
    return _$moveEmployee2RetiredListAsyncAction
        .run(() => super.moveEmployee2RetiredList(employee));
  }

  final _$_EmployeeStoreActionController =
      ActionController(name: '_EmployeeStore');

  @override
  void setNameEmp(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setNameEmp');
    try {
      return super.setNameEmp(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAge(int value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setAge');
    try {
      return super.setAge(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPosition(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setPosition');
    try {
      return super.setPosition(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(String value) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initNewEmployee() {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.initNewEmployee');
    try {
      return super.initNewEmployee();
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
age: ${age},
position: ${position},
phone: ${phone},
address: ${address},
isRetired: ${isRetired},
createAt: ${createAt},
employee: ${employee},
empNameCheck: ${empNameCheck},
checkInsertEmp: ${checkInsertEmp},
checkDelEmp: ${checkDelEmp},
fetchEmpFuture: ${fetchEmpFuture},
empList: ${empList},
fetchEmpRetiredFuture: ${fetchEmpRetiredFuture},
empRetiredList: ${empRetiredList},
empCanAddorUpdate: ${empCanAddorUpdate},
getAge: ${getAge},
getPosition: ${getPosition},
getAddress: ${getAddress},
getCreateAt: ${getCreateAt},
loading: ${loading},
isUserCheckPending: ${isUserCheckPending},
canAddEmp: ${canAddEmp},
getEmpCanAddOrUpdate: ${getEmpCanAddOrUpdate}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_FormErrorState.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_FormErrorState.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$ErrorStore on _ErrorStore, Store {
  final _$errorMessageAtom = Atom(name: '_ErrorStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_ErrorStoreActionController = ActionController(name: '_ErrorStore');

  @override
  void setErrorMessage(String message) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset(String value) {
    final _$actionInfo =
        _$_ErrorStoreActionController.startAction(name: '_ErrorStore.reset');
    try {
      return super.reset(value);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_ErrorStoreActionController.startAction(name: '_ErrorStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage}
    ''';
  }
}
