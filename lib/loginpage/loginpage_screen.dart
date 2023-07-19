import 'package:flutter/material.dart';
import 'package:project_uas/createaccountpage/createaccount_screen.dart';
import 'package:project_uas/floating/floating.dart';
import 'package:project_uas/menupage/menupage_provider.dart';
import 'package:project_uas/menupage/menupage_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(children: [
                Center(
                  child: Text(
                    "Let's Order",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Center(
                        child: Text(
                      "You don't need a silver fork to eat good food",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color.fromARGB(255, 75, 8, 8)),
                    )),
                  ],
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color.fromARGB(255, 133, 131, 131),
              ),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(top: 36),
              //width: 450,
              height: 300,
              child: Column(children: [
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54.withOpacity(0.2),
                                blurRadius: 6.0,
                                offset: Offset(0.0, 6.0)),
                          ],
                        ),
                        child: Card(
                          color: Color.fromARGB(255, 201, 200, 200),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Username",
                              ),
                            ),
                          ),
                        ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54.withOpacity(0.2),
                              blurRadius: 6.0,
                              offset: Offset(0.0, 6.0)),
                        ],
                      ),
                      child: Card(
                        color: Color.fromARGB(255, 201, 200, 200),
                        child: Center(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Password"),
                          ),
                        ),
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => Floating());
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 28),
                        backgroundColor: Color.fromARGB(255, 75, 8, 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => CreateAccount());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "Create Account",
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 72, 131)),
                        ))
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
