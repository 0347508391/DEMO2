import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cuoiki/Login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final userController = TextEditingController();

  bool _obscureText = true;

  Future<void> signUp(BuildContext context) async {
    final String apiUrl =
        'https://6386bbe1d9b24b1be3dd2e9d.mockapi.io/api/auth';

    // Check if email exists before attempting to register
    if (await checkEmailExists()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email already exists"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 201) {
        // User registered successfully
        print('User registered successfully');
        // Clear form fields
        emailController.clear();
        passwordController.clear();
        // Optionally, you can navigate to the login page after successful registration
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Name()));
      } else {
        // Failed to register user
        print('Failed to register user');
      }
    } catch (e) {
      // Handle any error that occurred during the API call
      print('Error: $e');
    }
  }

  Future<bool> checkEmailExists() async {
    final String apiUrl =
        'https://6386bbe1d9b24b1be3dd2e9d.mockapi.io/api/auth';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        return users.any((user) => user['email'] != null && user['email'] == emailController.text,
        );
      } else {
        print('Failed to check email existence');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Default to false in case of errors
    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                height: 820,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.greenAccent,
                ])),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120.0),
                        bottomRight: Radius.circular(120.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('img.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 510.0,
                    height: 200.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 160.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                labelText: 'Email Address',
                                fillColor: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter email";
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!@#$%^&*()_+-={|};':,.]+@[a-zA-Z0-9-]+?\.[a-zA-Z]+$")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return "Enter Valid Email";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  icon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (passwordController.text.length < 6) {
                                  return "Password Length Should be more than 6 characters";
                                }
                              },
                            )),

                        SizedBox(height: 60),
                        InkWell(
                          splashColor: Colors.black,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              signUp(context);

                            } else {
                              print('Please fill in all required fields.');
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40.0),
                            height: 53,
                            width: 420,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.black,
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
