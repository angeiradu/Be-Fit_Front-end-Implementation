// ignore_for_file: use_key_in_widget_constructors, unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text('Back'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Sign Up', style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CreateAccountForm(),
        ),
      ),
    );
  }
}

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _email;
  String? _phoneNumber;
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Full Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              isCollapsed: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            onSaved: (value) {
              _fullName = value;
            },
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              isCollapsed: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value;
            },
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Phone Number (optional)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone Number (optional)',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              isCollapsed: true,
            ),
            onSaved: (value) {
              _phoneNumber = value;
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                ),
                const Text('I accept the', style: TextStyle(fontSize: 16)),
                const Text(' terms', style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal,
                )),
                const Text(' and ', style: TextStyle(fontSize: 16)),
                const Text('conditions', style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal,
                )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              minimumSize: const Size(375, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: const BorderSide(color: Colors.teal, width: 2),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_termsAccepted) {
                  // Implement sign up functionality
                } else {
                  // Show a message to accept the terms
                }
              }
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(375, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: const BorderSide(color: Colors.black),
              ),
            ).copyWith(
              overlayColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {
              // Implement login with Google functionality
            },
            child: const Text(
              'Login with Google',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Are you a member?', style: TextStyle(color: Colors.black)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login', style: TextStyle(color: Colors.teal)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
