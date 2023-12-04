

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Logic to validate login credentials
    String email = _emailController.text;
    String password = _passwordController.text;
    bool loginSuccess = true; // Placeholder for actual login logic

    // Validation logic
    if (email == 'test.com' && password == 'test') {
      loginSuccess = true;
    } else {
      loginSuccess = false;
    }

    if (loginSuccess) {
      Navigator.pushReplacementNamed(context, 'RewardsScreen'); // Navigate to RewardsScreen on successful login
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password.'),
            backgroundColor: Colors.red,),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Welcome to UnWired Rewards"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Welcome to Unwired Rewards',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0, // Larger font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0), // Spacing after the title
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () => _login(context),
            ),
          ],
        ),
      ),
    );
  }
}
