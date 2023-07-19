import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/cartpage/cartpage_provider.dart';
import 'package:project_uas/paymentpage/hasilpesan_screen.dart';
import 'package:project_uas/paymentpage/pembayaran_screen.dart';
import 'package:provider/provider.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  final GlobalKey<_CartPageScreenState> _bodyKey =
      GlobalKey<_CartPageScreenState>();

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<CartPageProvider>(context, listen: false).initialData();
      final prov = Provider.of<CartPageProvider>(context, listen: false);
      if (prov.data != null) {
        final itemCount = prov.data['data']!.length;
      }
    });
    super.initState();
  }

  int _currentIndex = 2;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  TextEditingController _nomorMejaController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  bool isSelected = true;
  TextEditingController? _time;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CartPageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Keranjang",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Pemesanan",
            style: GoogleFonts.biryani(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Text(
              "Nomor Meja",
              style: GoogleFonts.biryani(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(
                    1000,
                    105,
                    61,
                    61,
                  )),
            ),
            trailing: SizedBox(
              height: 100,
              width: 250,
              child: TextField(
                controller: _nomorMejaController,
              ),
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Text(
              "Catatan",
              style: GoogleFonts.biryani(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(
                    1000,
                    105,
                    61,
                    61,
                  )),
            ),
            trailing: SizedBox(
              height: 100,
              width: 250,
              child: TextField(
                controller: _catatanController,
                maxLines: 5,
                minLines: 1,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Daftar Pemesanan",
            style: GoogleFonts.biryani(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
              child: Builder(
            key: _bodyKey,
            builder: (BuildContext context) {
              return body(context);
            },
          )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Color.fromARGB(255, 133, 131, 131),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Pesanan",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Jumlah Item',
                        style: GoogleFonts.beVietnamPro(color: Colors.white),
                      ),
                    ),
                    Text(
                      '${prov.getTotalItems()} Item    ',
                      style: GoogleFonts.beVietnamPro(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Total',
                        style: GoogleFonts.beVietnamPro(color: Colors.white),
                      ),
                    ),
                    Text(
                      'Rp.${prov.getTotalPrice()}    ',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Jam',
                        style: GoogleFonts.biryani(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                      enabled: false,
                      controller: _time,
                      decoration: const InputDecoration(
                        hintText: 'Hanya Tersedia Untuk Pesan Nanti',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 196, 193, 193),
                            fontSize: 11),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  'Pesan',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(101, 50),
                        backgroundColor: const Color.fromARGB(255, 75, 8, 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => PaymentPage());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        "Sekarang",
                        style: GoogleFonts.biryani(),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(101, 50),
                        backgroundColor: const Color.fromARGB(255, 75, 8, 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        var res = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (res != null) {
                          setState(() {
                            _time = TextEditingController(
                                text: res.format(context));
                          });
                        }
                        ;
                        Route route = MaterialPageRoute(
                            builder: (context) => PaymentPage());
                        Navigator.push(context, route);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.timer),
                          Text(
                            '  Nanti',
                            style: GoogleFonts.biryani(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<CartPageProvider>(context);

    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
          children: List.generate(
        prov.data['data']!.length,
        (index) {
          var item = prov.data['data']![index];
          return Column(
            children: [
              Card(
                color: Color.fromARGB(234, 233, 233, 1000),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                        leading: Container(
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['nama'],
                              style: GoogleFonts.biryani(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Rp. ${item['harga'].toString()},-',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Rating ${item['rating'].toString()}'),
                              ],
                            ),
                          ],
                        )),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(
                              255,
                              75,
                              8,
                              8,
                            ),
                          ),
                          width: 102,
                          height: 40,
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            prov.totMinHarga(index);
                                          });
                                        },
                                        icon: const Icon(Icons.remove),
                                        iconSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: prov.pesanan['data'][index]['total']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            prov.totHarga(index);
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                        iconSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ));
    }
  }
}
