import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_state/auth_state.dart';


class SecondSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Details'),
      ),
      body: EmployeeForm(),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your position';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Consumer<AuthState>(
              builder: (context, authState, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      // For example, you can access the entered values using the controllers:
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      int age = int.parse(_ageController.text);
                      String email = _emailController.text;
                      String position = _positionController.text;
                      String phone = _phoneController.text;
                      authState.registerCostumerInformationController(context, firstName, lastName, age, email, phone, position);

                      // Here you can do whatever you want with the collected data
                      // For now, let's just print them
                      // print('First Name: $firstName');
                      // print('Last Name: $lastName');
                      // print('Age: $age');
                      // print('Email: $email');
                      // print('Position: $position');
                      // print('Phone: $phone');
                    }
                  },
                  child: Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
