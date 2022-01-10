
import 'package:mobx_emp_manager/data/local/database_helper.dart';
import 'package:mobx_emp_manager/models/employees.dart';

class Repository {

  DatabaseHelper _databaseHelper;

  Repository(this._databaseHelper);

  Future<List<Employees>> getEmployees() async {
    return await _databaseHelper.getEmployees();
  }

  Future<int> insertEmpLocal(Employees employees) => _databaseHelper
      .insertEmpLocal(employees)
      .then((id) => id)
      .catchError((error) => throw error);


  Future<int> delete(int id) => _databaseHelper
      .deleteEmpById(id)
      .then((id) => id)
      .catchError((error) => throw error);
}