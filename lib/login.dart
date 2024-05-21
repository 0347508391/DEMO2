import 'dart:convert';

import 'package:cuoiki/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cuoiki/Register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  bool emailExists = false;

  bool passExists = false;

  bool showErrorBox = false;

  Future<void> login(BuildContext context) async {
    final String apiUrl =
        'https://6386bbe1d9b24b1be3dd2e9d.mockapi.io/api/auth';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        emailExists = users.any((user) => user['email'] != null && user['email'] == emailController.text);
        passExists = users.any((user) => user['password'] != null && user['password'] == passwordController.text);
        if (emailExists) {
          print('');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Email not found in mock API"),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (passExists) {
          print('');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password wrong"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('Failed to Login');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(

            child: Stack(
              children: [
                Container(
                  height: 830,
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
                            margin: EdgeInsets.only(left: 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome back',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                labelText: 'Email Address',

                              ),
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
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (passwordController.text.length < 6) {
                                  return "Password Length Should be more than 6 characters";
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            splashColor: Colors.black,
                            onTap: () async {
                              if (_formKey.currentState!.validate() &&
                                  !showErrorBox) {
                                await login(context);
                                if (emailExists && passExists) {
                                  Login();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                } else {
                                  print('Please fill in all required fields.');
                                }
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
                                  'Login',
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
                                  'New here?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.black,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Register(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Center(
                                      child: Text(
                                        'Register',
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
      ),
    );
  }

}
