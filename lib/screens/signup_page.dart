import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  GlobalKey<FormState> _signupform = GlobalKey<FormState>();

  String? username;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _signupform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 70,
                child: const Text(
                  "Signup Page",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  controller: usernamecontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter username";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      username = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter username",
                    prefixIcon: const Icon(Icons.account_circle_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      username = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter email",
                    prefixIcon: const Icon(Icons.mail),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_signupform.currentState!.validate()) {
                    _signupform.currentState!.save();

                    final share = await SharedPreferences.getInstance();

                    share.setString('username', usernamecontroller.text);
                    share.setString('email', emailcontroller.text);
                    share.setString('password', passwordcontroller.text);
                    share.setBool('signup', true);

                    Navigator.of(context).pushReplacementNamed('home_page');
                  }
                },
                child: const Text("SIGNUP"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
