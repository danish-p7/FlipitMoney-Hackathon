# flipitmoney_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

************HEY************************
This Flutter project is an employee management app with three screens:

1. RegisterEmployeeScreen: This screen is used to register employees with their job-id, name, address, department, and salary. The job-id is auto-generated and cannot be modified by the user. The bioJoke field is filled using an API call to icanhazdadjoke.com to get a random joke. The user input is validated to ensure that the name only contains alphabets and the salary is a number.

2. EmployeeListScreen: This screen displays a list of all registered employees with their picture, jobId, name, and bioJoke. The list can be sorted by name. Clicking on any employee's card opens the EmployeeDetailsScreen.

3. EmployeeDetailsScreen: This screen displays the details of the selected employee in a popup. It shows the employee's picture, jobId, name, address, department, bioJoke, and salary.

To run this code:

1. Install Flutter on your machine.
2. Clone the project from GitHub(if the github link is provided).
3. Open the project in your preferred IDE.
4. Run the command flutter pub get to get all the required dependencies.
5. Run the command flutter run to launch the app on your emulator or physical device.


First page of app ie first screen
![Alt text](../../Downloads/Screenshot_20230311-222246.png)

Employee List on 2nd screen (unsorted)
![Alt text](../../Downloads/Screenshot_20230311-222253.png)

Employee List on 2nd screen (sorted), after pressing the sort button down below
![Alt text](../../Downloads/Screenshot_20230311-222300%20(1).png)

Employee details poped up after clicking on any employee
![Alt text](../../Downloads/Screenshot_20230311-222304.png)

Employ detail with randomly generated bioJoke and editable infos(exceot job id) on screen 3
![Alt text](../../Downloads/Screenshot_20230311-222313.png)

**********ThankYou***************