import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flipitmoney_task/Screens/employee_details.dart';
import 'package:flipitmoney_task/Screens/employee_list.dart';
import 'package:flipitmoney_task/Screens/register_employees.dart';
import 'package:flipitmoney_task/Services/employee.dart';
import 'package:flipitmoney_task/Services/random_string.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final GestureTapCallback onTap;

  const EmployeeCard({required this.employee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/placeholder.png'),
                radius: 30.0,
                // backgroundColor: Colors.white54,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${employee.name} (${employee.jobID})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    employee.bioJoke,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
