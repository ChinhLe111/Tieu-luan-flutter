import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_emp_manager/models/employees.dart';
import 'package:mobx_emp_manager/screens/add_employee_screen.dart';
import 'package:mobx_emp_manager/screens/retired_employee_screen.dart';
import 'package:mobx_emp_manager/stores/employee_store.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  EmployeeStore _employeeStore;

  @override
  void initState() {
    _employeeStore = Provider.of<EmployeeStore>(context, listen: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _employeeStore.getEmployees();
    super.didChangeDependencies();
  }
  void _addEmployee() {
    Route route = MaterialPageRoute(builder: (context) => AddEmployeeScreen());
    Navigator.push(context, route);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employees'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              Container(
                child: new Text(
                  "EMPLOYEE MANAGEMENT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white
                  ) ,
                ),
                decoration: new BoxDecoration(
                  color: Colors.orange,
                ),
                height: 50,
                padding: EdgeInsets.all(12.0),
              ),
              new ListTile(
                title: new Text("Home page"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                title: new Text("Retired Employees"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new RetiredEmployeeScreen()));
                },
              ),
            ],
          ),
        ),
        body: _buildMainContent(),
        floatingActionButton:  FloatingActionButton(
          onPressed: _addEmployee,
          tooltip: 'Add',
          child: Icon(Icons.add),)
    );
  }
  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _employeeStore.loading
            ? CircularProgressIndicator(backgroundColor: Colors.blue,)
            : _buildListView();
      },
    );
  }

  Widget _buildListView() {
    return _employeeStore.empList != null
        ? SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in _employeeStore.empList)
              _buildItemEmployee(item)
          ],
        ),
      ),
    )
        : Center(
      child: Text(
        "No data",
      ),
    );
  }
  _buildItemEmployee(Employees emp) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blueGrey.withOpacity(0.7)),
          )
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle
            ),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: CircleAvatar(
                child: Icon(
                  Icons.person_outline,
                  size: 40.0,
                  color: Colors.blue.shade600,
                ),
                backgroundColor: Colors.white38,
              ),
            ),
          ),
          SizedBox(width: 12.0,),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      emp.name ?? "",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Phone: ' + (emp.phone ?? "--"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Position: ' + (emp.position?? "--"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Address: ' + (emp.address ??"--"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade600,
                    size: 30,
                  ),
                  onPressed:() {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext cxt) {
                          return AlertDialog(
                            title: const Text('Confirm'),
                            content: const Text('Do you want to delete it ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(cxt),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: (){
                                  _employeeStore.moveEmployee2RetiredList(emp);
                                  Navigator.pop(cxt);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        }
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
