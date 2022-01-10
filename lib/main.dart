import 'package:flutter/material.dart';
import 'package:mobx_emp_manager/data/local/database_helper.dart';
import 'package:mobx_emp_manager/data/repository.dart';
import 'package:mobx_emp_manager/screens/employee_screen.dart';
import 'package:mobx_emp_manager/stores/employee_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final EmployeeStore _employeeStore = EmployeeStore();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EmployeeStore>(create: (_) => _employeeStore),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: EmployeeScreen(),
      ),
    );
  }
}
