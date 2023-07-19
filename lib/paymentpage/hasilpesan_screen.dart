import 'package:flutter/material.dart';
import 'package:project_uas/cartpage/cartpage_screen.dart';
import 'package:project_uas/menupage/menupage_screen.dart';

class HasilPesan extends StatefulWidget {
  const HasilPesan({super.key});

  @override
  State<HasilPesan> createState() => _HasilPesanState();
}

class _HasilPesanState extends State<HasilPesan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 25),
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(255, 221, 181, 4),
              ),
              child: Center(
                child: Icon(
                  Icons.check_outlined,
                  color: Color.fromARGB(255, 121, 56, 3),
                  size: 220,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text("Pesanan Diterima",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text("Pesanan mu sudah diterima dan akan segera",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text("dipersiapkan, silahkan menunggu dengan",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text("santuy ya..", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => CartPageScreen());
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 124, 122, 122)),
                  child: Center(
                      child: Text(
                    "Lihat Pesanan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 255, 255, 255)),
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => MenuPageScreen());
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 75, 8, 8)),
                  child: Center(
                    child: Text(
                      "Pesan Lainnya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
