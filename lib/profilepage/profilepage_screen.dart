import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/cartpage/cartpage_screen.dart';
import 'package:project_uas/homepage/homepage_screen.dart';
import 'package:project_uas/profilepage/profileedit.dart';
import 'package:project_uas/profilepage/profilepage_provider.dart';
import 'package:provider/provider.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  int _currentIndex = 3;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ProfilePageProvider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: body(context)),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<ProfilePageProvider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
          children: List.generate(
        prov.data['data']!.length,
        (index) {
          var item = prov.data['data']![index];
          return Card(
            color: Color.fromARGB(234, 233, 233, 1000),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(item['img']), radius: 40),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['nama'],
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => Profiledit());
                              Navigator.push(context, route);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 75, 8, 8),
                            ))
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['email'],
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(
                          item['noHp'],
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    )),
                Divider(
                  thickness: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => CartPageScreen());
                            Navigator.push(context, route);
                          },
                          icon: const Icon(
                            Icons.list_alt,
                            color: Color.fromARGB(255, 75, 8, 8),
                          ),
                          label: const Text(
                            "Pesanan",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) => showAlertDialog(context)),
                          icon: const Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 75, 8, 8),
                          ),
                          label: const Text(
                            "Sign Out",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ));
    }
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Sign Out"),
      content: Text("Do you wanna Log Out?"),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("No")),
        TextButton(
            onPressed: () {
              Route route = MaterialPageRoute(builder: (context) => HomePage());
              Navigator.push(context, route);
            },
            child: Text("Yes"))
      ],
    );
  }
}
