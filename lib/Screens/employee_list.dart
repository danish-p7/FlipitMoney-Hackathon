
import 'package:flutter/material.dart';
import 'package:flipitmoney_task/Screens/employee_details.dart';
import 'package:flipitmoney_task/Screens/employee_list.dart';
import 'package:flipitmoney_task/Screens/register_employees.dart';
import 'package:flipitmoney_task/Services/employee.dart';
import 'package:flipitmoney_task/Services/random_string.dart';
import 'package:flipitmoney_task/Services/employee_card.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter/foundation.dart';

Future<String> getRandomJoke() {
  return http
      .get(Uri.parse('https://icanhazdadjoke.com/'), headers: {'Accept': 'text/plain'})
      .then((response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load joke');
    }
  });
}

class EmployeeListScreen extends StatefulWidget {

  final List<Employee> employees = [
    Employee(
      jobID: 'dhj563',
      name: 'John Doe',
      address: '123 Main St',
      department: 'Marketing',
      bioJoke: 'Why was the math book sad? Because it had too many problems.',
      salary: 50000,
    ),
    Employee(
      jobID: 'def456',
      name: 'Jane Smith',
      address: '456 Elm St',
      department: 'Sales',
      bioJoke: 'I\'m on a whiskey diet. I\'ve lost three days already.',
      salary: 60000,
    ),
    Employee(
      jobID: 'def456',
      name: 'Jane Smith',
      address: '456 Elm St',
      department: 'Sales',
      bioJoke: 'Why do we tell actors to "break a leg"? Because every play has a cast.',
      salary: 60000,
    ),

    Employee(
      jobID: 'ghi789',
      name: 'Bob Johnson',
      address: '789 Oak St',
      department: 'Engineering',
      bioJoke: 'Why did the tomato turn red? Because it saw the salad dressing!',
      salary: 70000,
    ),

    Employee(
      jobID: 'jkl012',
      name: 'Alice Lee',
      address: '012 Pine St',
      department: 'Finance',
      bioJoke: 'Why did the scarecrow win an award? Because he was outstanding in his field.',
      salary: 80000,
    ),

    Employee(
      jobID: 'mno345',
      name: 'David Kim',
      address: '345 Cedar St',
      department: 'Human Resources',
      bioJoke: 'Why do seagulls fly over the sea? Because if they flew over the bay, they would be bagels.',
      salary: 90000,
    ),

    Employee(
      jobID: 'pqr678',
      name: 'Samantha Chen',
      address: '678 Maple St',
      department: 'Operations',
      bioJoke: 'Why did the chicken cross the playground? To get to the other slide.',
      salary: 100000,
    ),

    Employee(
      jobID: 'stu901',
      name: 'Michael Nguyen',
      address: '901 Spruce St',
      department: 'Customer Service',
      bioJoke: 'Why don\'t scientists trust atoms? Because they make up everything.',
      salary: 110000,
    ),

    Employee(
      jobID: 'vwx234',
      name: 'Emily Park',
      address: '234 Birch St',
      department: 'Product Management',
      bioJoke: 'What did the janitor say when he jumped out of the closet? "Supplies!"',
      salary: 120000,
    ),

    Employee(
      jobID: 'yzf567',
      name: 'Jason Patel',
      address: '567 Pineapple St',
      department: 'Research and Development',
      bioJoke: 'Why did the coffee file a police report? Because it got mugged.',
      salary: 130000,
    ),

    Employee(
      jobID: 'abc890',
      name: 'Karen Kim',
      address: '890 Walnut St',
      department: 'Design',
      bioJoke: 'Why don\'t eggs tell jokes? Because they\'d crack each other up!',
      salary: 140000,
    ),

    Employee(
      jobID: 'def123',
      name: 'Daniel Lee',
      address: '123 Peach St',
      department: 'Legal',
      bioJoke: 'Why was the computer cold? Because it left its Windows open.',
      salary: 150000,
    ),

    // add more default employees here if desired
  ];



  // const EmployeeListScreen({Key? key, required this.employees}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  bool _sortAscending = true;

  late List<Employee> _sortedEmployees = [
    Employee(
      jobID: 'abc123',
      name: 'John Doe',
      address: '123 Main St',
      department: 'Marketing',
      bioJoke: 'Why was the math book sad? Because it had too many problems.',
      salary: 50000,
    ),
    Employee(
      jobID: 'def456',
      name: 'Jane Smith',
      address: '456 Elm St',
      department: 'Sales',
      bioJoke: 'What did the grape say when it got stepped on? Nothing, it just let out a little wine.',
      salary: 60000,
    ),
    // add more default employees here if desired
  ];

  void _showEmployeeDetails(BuildContext context, Employee employee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Employee Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Job ID: ${employee.jobID}'),
                Text('Name: ${employee.name}'),
                Text('Address: ${employee.address}'),
                Text('Department: ${employee.department}'),
                Text('Bio Joke: ${employee.bioJoke}'),
                Text('Salary: ${employee.salary}'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    _sortedEmployees = widget.employees.toList();
  }

  Future<ImageProvider> _getRandomImage() async {
    final response = await http.get(Uri.parse('https://picsum.photos/200'));
    if (response.statusCode == 200) {
      return NetworkImage(response.request?.url.toString() ?? " ");
    } else {
      throw Exception('Failed to load image');
    }
  }

  void _sortEmployees() {
    setState(() {
      if (_sortAscending) {
        _sortedEmployees.sort((a, b) => a.name.compareTo(b.name));
      } else {
        _sortedEmployees.sort((a, b) => b.name.compareTo(a.name));
      }
      _sortAscending = !_sortAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: _sortedEmployees.length,
        itemBuilder: (BuildContext context, int index) {
          return EmployeeCard(
            employee: _sortedEmployees[index],
            onTap: () => _showEmployeeDetails(context, _sortedEmployees[index])
          );
        },
      ),


      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.sort_by_alpha),
            onPressed: () {
              setState(() {
                _sortedEmployees.sort((a, b) => a.name.compareTo(b.name));
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.next_plan_outlined),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EmployeeDetailsScreen()));
            }
          ),
    ],
  ),




    );
  }
}
