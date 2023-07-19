import 'package:flutter/material.dart';
import 'package:project_uas/cartpage/cartpage_screen.dart';
import 'package:project_uas/floating/floating.dart';
import 'package:project_uas/menupage/menupage_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPageScreen extends StatefulWidget {
  const MenuPageScreen({Key? key}) : super(key: key);

  @override
  State<MenuPageScreen> createState() => _MenuPageScreenState();
}

class _MenuPageScreenState extends State<MenuPageScreen> {
  int _currentIndex = 0;

  void changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<MenuPageProvider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MenuPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        title: Text(
          "Menu",
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => CartPageScreen());
                  Navigator.push(context, route);
                },
                icon: Icon(Icons.shop),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow),
                  child: Text(
                    prov.ttlNotif.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                prov.resetNotif();
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: Column(
                children: [
                  //Judul Aplikasi
                  Text(
                    "Coffe Republic",
                    style: GoogleFonts.raleway(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                          Provider.of<MenuPageProvider>(context, listen: false)
                              .ubahList('minuman');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _currentIndex == 0
                              ? Color.fromARGB(
                                  1000,
                                  105,
                                  61,
                                  61,
                                )
                              : Color.fromARGB(255, 75, 8,
                                  8), // Warna latar belakang ketika tombol diklik atau tidak diklik
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.coffee, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Drinks',
                              style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                          Provider.of<MenuPageProvider>(context, listen: false)
                              .ubahList('makanan');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _currentIndex == 1
                              ? Color.fromARGB(
                                  1000,
                                  105,
                                  61,
                                  61,
                                )
                              : Color.fromARGB(255, 75, 8,
                                  8), // Warna latar belakang ketika tombol diklik atau tidak diklik
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.food_bank, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Food',
                              style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                          Provider.of<MenuPageProvider>(context, listen: false)
                              .ubahList('snack');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _currentIndex == 2
                              ? Color.fromARGB(
                                  1000,
                                  105,
                                  61,
                                  61,
                                )
                              : Color.fromARGB(255, 75, 8,
                                  8), // Warna latar belakang ketika tombol diklik atau tidak diklik
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.egg, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Snacks',
                              style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Builder(
                builder: (BuildContext context) {
                  final prov = Provider.of<MenuPageProvider>(context);
                  if (prov.data == null) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: prov.data['data']!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = prov.data['data']![index];
                        return Column(
                          children: [
                            Card(
                              color: Color.fromARGB(234, 233, 233, 1000),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    trailing: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(
                                        item['img'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // leading: ,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['nama'],
                                          style: GoogleFonts.biryani(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rp. ${item['harga'].toString()},-',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rating ${item['rating'].toString()}',
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              prov.setTTLNotif = 1;
                                            },
                                            icon: Icon(Icons.add_box),
                                            color:
                                                Color.fromARGB(255, 75, 8, 8),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.favorite),
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
