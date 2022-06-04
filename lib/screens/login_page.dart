import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();

  GlobalKey<FormState> _loginform = GlobalKey<FormState>();

  String? pass;
  String? email;

  bool checkval = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _loginform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 70,
                child: const Text(
                  "Login Page",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  controller: emailcontrol,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      email = val;
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
                  controller: passcontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      pass = val;
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
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Checkbox(
                      value: checkval,
                      onChanged: (val) async {
                        setState(() {
                          checkval = val!;
                        });

                        final share = await SharedPreferences.getInstance();

                        share.setBool('check', val!);
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("I have read and agree to the terms of service"),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_loginform.currentState!.validate()) {
                    _loginform.currentState!.save();

                    final share = await SharedPreferences.getInstance();

                    if (share.getString('password') == passcontroller.text &&
                        share.getString('email') == emailcontrol.text) {
                      Navigator.of(context).pushReplacementNamed('home_page');
                    }
                  }
                },
                child: const Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
