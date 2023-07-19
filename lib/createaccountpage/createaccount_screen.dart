import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/loginpage/loginpage_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool agree = false;
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.fill,
        )),
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
              padding: EdgeInsets.only(top: 15),
              height: 316,
              child: Column(children: [
                Text(
                  "Create Account",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 40,
                        width: 126,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.1),
                              ),
                              hintText: "First Name"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 40,
                        width: 126,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.1),
                              ),
                              hintText: "Last Name"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.1),
                        ),
                        hintText: "Email"),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 40,
                  width: 270,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.1),
                        ),
                        hintText: "Password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: agree,
                      onChanged: (bool? value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    Text("I agree with privacy and policy"),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 28),
                            backgroundColor: Color.fromARGB(255, 75, 8, 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => LoginPage());
                          Navigator.push(context, route);
                        },
                        child: Text("Create Account"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Sudah Punya Akun?"),
                      ),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => LoginPage());
                              Navigator.push(context, route);
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 72, 131)))),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
