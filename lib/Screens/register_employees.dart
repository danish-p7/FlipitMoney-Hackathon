import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flipitmoney_task/Screens/employee_details.dart';
import 'package:flipitmoney_task/Screens/employee_list.dart';
import 'package:flipitmoney_task/Screens/register_employees.dart';
import 'package:flipitmoney_task/Services/employee.dart';
import 'package:flipitmoney_task/Services/random_string.dart';
import 'dart:math' show Random;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RegisterEmployeeScreen extends StatefulWidget {
  @override
  _RegisterEmployeeScreenState createState() => _RegisterEmployeeScreenState();
}

class _RegisterEmployeeScreenState extends State<RegisterEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _departmentController = TextEditingController();
  final _salaryController = TextEditingController();
  Employee _newEmployee = Employee();

  Future<String> _getRandomJoke() async {
    final response = await http.get(Uri.parse('https://icanhazdadjoke.com/'),
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['joke'];
    } else {
      throw Exception('Failed to load joke');
    }
  }

  String randomAlphaNumeric(int n) {
    const alphaNumericChars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    String randomID = '';

    for (int i = 0; i < n; i++) {
      int randIndex = Random().nextInt(alphaNumericChars.length);
      randomID += alphaNumericChars.substring(randIndex, randIndex + 1);
    }

    return randomID;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _departmentController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a name';
                  } else if (value != null &&
                      !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Name must only contain alphabets';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter an address';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _departmentController,
                decoration: InputDecoration(labelText: 'Department'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a department';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a salary';
                  } else if (value != null && int.tryParse(value) == null) {
                    return 'Salary must be a number';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  child: Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _newEmployee.jobID = randomAlphaNumeric(6);
                      _newEmployee.name = _nameController.text;
                      _newEmployee.address = _addressController.text;
                      _newEmployee.department = _departmentController.text;
                      _newEmployee.salary = int.parse(_salaryController.text);
                      _newEmployee.bioJoke = await _getRandomJoke();
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EmployeeListScreen()));

                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
