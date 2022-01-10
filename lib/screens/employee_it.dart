import 'package:flutter/material.dart';
import 'package:mobx_emp_manager/stores/employee_store.dart';
import 'package:provider/provider.dart';

import 'add_employee_screen.dart';

class EmployeeIT extends StatefulWidget {
  const EmployeeIT({key}) : super(key: key);

  @override
  _EmployeeITState createState() => _EmployeeITState();
}

class _EmployeeITState extends State<EmployeeIT> {
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
        title: Text('Nhân viên IT'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
        children: <Widget>[
          ProductBox(
            id: "1",
            name: "Lê Đức Doãn Chính",
            age: "20",
            phone: "0123456789",
            address: "Phạm Thị Liên",
          ),
          ProductBox(
            id: "2",
            name: "Lê Đức Doãn Chính 1",
            age: "20",
            phone: "0123456789",
            address: "Phạm Thị Liên",
          ),
          ProductBox(
            id: "3",
            name: "Lê Đức Doãn Chính 2",
            age: "20",
            phone: "0123456789",
            address: "Phạm Thị Liên",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEmployee,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.id, this.name, this.age, this.phone, this.address})
      : super(key: key);
  final String id;
  final String name;
  final String age;
  final String phone;
  final String address;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 110,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 150.0,
            ),
            Icon(
              Icons.person_outline,
              size: 40.0,
              color: Colors.blue.shade600,
            ),
            SizedBox(
              width: 150.0,
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Age: " + this.age.toString()),
                        Text("Phone: " + this.phone.toString()),
                        Text("Address: " + this.address.toString()),
                      ],
                    ))),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red.shade600,
                  size: 30,
                ),
                onPressed: () {
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
                            onPressed: () {
                              //_employeeStore.moveEmployee2RetiredList(emp);
                              // Navigator.pop(cxt);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
