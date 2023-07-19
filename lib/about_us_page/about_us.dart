import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About_Us extends StatefulWidget {
  const About_Us({super.key});

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_about_us.png'),
                fit: BoxFit.fill,
                opacity: 0.05)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 13),
                width: 95,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400),
                child: const Center(
                  child: Text(
                    'ABOUT US',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 11),
                    width: 187,
                    child: Column(
                      children: const [
                        Text(
                          'Di era modern ini, segala hal dapat diakses melalui smartphone. Dimulai dari berbicara dengan sanak saudara, mencari berita, hingga belajar bisa melalui smartphone.',
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            'Tak luput dari kegiatan jual beli yang kita lakukan sehari-hari. Kita dituntut untuk terus mengikuti zaman, banyak coffe shop yang beredar diluar sana yang sudah mulai melakukan digitalisasi terhadap proses transaksi dagangannya.'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 30),
                    width: 190,
                    child: Column(
                      children: const [
                        Text(
                          'Tetapi masih ada yang belum melakukan digitalisasi, tentu saja itu bisa saja sedikit banyaknya merupakan nilai kurang dari coffee shop tersebut.  ',
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            'Sekarang masyarakat sudah berbondong bondong beralih ke e-money, e-wallet dan pemabayaran melalui online lainnya. Sehingga cukup meghemat waktu dalam pembayaran bahkan menghemat tempat di dompet dikarenakan tidak perlu lagi menyimpan uang cash.'),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 13),
                width: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Maka pada kesempatan kali ini, kami ingin membuat aplikasi coffee shop dengan nama :',
                    ),
                    Text(
                      '“COFFEE REPUBLIC”,',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'dimana untuk membantu semua caffe-caffe dan para costumer berinteraksi dalam hal menerima pesanan secara online',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 95,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400),
                child: const Center(
                  child: Text(
                    'TEAM',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 13),
                    width: 110,
                    height: 165,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          maxRadius: 50,
                          //Foto Alvannis
                          backgroundImage: AssetImage('assets/alvan.jpeg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '211111147',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Alvannis Damai',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Amazihono',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 13),
                    width: 110,
                    height: 165,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          maxRadius: 50,
                          //Foto Charlos
                          backgroundImage: AssetImage('assets/carlos.jpeg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '211111734',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Carlos Matio',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Simanjuntak',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 13),
                width: 110,
                height: 165,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      maxRadius: 50,
                      //Foto Pilippi
                      backgroundImage: AssetImage('assets/pilippi.jpeg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '211111734',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pilippi Kartifo',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pasaribu',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/e_commerce.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
