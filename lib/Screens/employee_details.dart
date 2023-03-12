import 'package:flutter/material.dart';
import 'package:flipitmoney_task/Screens/employee_details.dart';
import 'package:flipitmoney_task/Screens/employee_list.dart';
import 'package:flipitmoney_task/Screens/register_employees.dart';
import 'package:flipitmoney_task/Services/employee.dart';
import 'package:flipitmoney_task/Services/random_string.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsScreen extends StatefulWidget {
  final Employee employee = Employee(
    jobID: 'ABC123',
    name: 'John Doe',
    address: '123 Main St',
    department: 'Engineering',
    salary: 100000,
    bioJoke: 'Why was the math book sad? Because it had too many problems.',
  );

  // const EmployeeDetailsScreen({Key? key, required this.employee}) : super(key: key);

  @override
  _EmployeeDetailsScreenState createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  String _bioJoke = '';

  Future<String> _getRandomJoke() async {
    final response = await http.get(Uri.parse('https://icanhazdadjoke.com/'), headers: {'Accept': 'text/plain'});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load joke');
    }
  }

  @override
  void initState() {
    super.initState();
    _getRandomJoke().then((value) {
      setState(() {
        _bioJoke = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController(text: widget.employee.name);
    final TextEditingController _addressController = TextEditingController(text: widget.employee.address);
    final TextEditingController _departmentController = TextEditingController(text: widget.employee.department);
    final TextEditingController _salaryController = TextEditingController(text: widget.employee.salary.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job-ID: ${widget.employee.jobID}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(
                labelText: 'Department',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bio Joke:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              _bioJoke,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(
                labelText: 'Salary',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      Employee(
                        jobID: widget.employee.jobID,
                        name: _nameController.text,
                        address: _addressController.text,
                        department: _departmentController.text,
                        bioJoke: _bioJoke,
                        salary: int.parse(_salaryController.text),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class EmployeeDetailsScreen extends StatelessWidget {
//   final Employee employee;
//
//   EmployeeDetailsScreen({required this.employee});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Job ID: ${employee.jobID}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Name: ${employee.name}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Address: ${employee.address}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Department: ${employee.department}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Bio Joke: ${employee.bioJoke}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               'Salary: \$${employee.salary}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

