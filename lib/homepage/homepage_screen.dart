import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/about_us_page/about_us.dart';
import 'package:project_uas/createaccountpage/createaccount_screen.dart';
import 'package:project_uas/loginpage/loginpage_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
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
            Container(
              margin: EdgeInsets.only(top: 420),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 113, 112, 112),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              width: 420,
              height: 280,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Coffe Republic",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(198, 28),
                      backgroundColor: Color.fromARGB(255, 75, 8, 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => LoginPage());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum Punya Akun?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => CreateAccount());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 72, 131)),
                          ))
                    ],
                  ),
                ),
                Container(
                  child: TextButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (context) => About_Us());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        "About Us",
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 72, 131)),
                      )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
