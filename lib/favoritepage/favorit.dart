import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/favoritepage/favorit_provider.dart';
import 'package:project_uas/paymentpage/pembayaran_screen.dart';
import 'package:provider/provider.dart';

class Favorit_Screen extends StatefulWidget {
  const Favorit_Screen({super.key});

  @override
  State<Favorit_Screen> createState() => _Favorit_ScreenState();
}

class _Favorit_ScreenState extends State<Favorit_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        title: Center(
          child: Text(
            'Daftar Favorite',
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final prov = Provider.of<Favorit_Provider>(context);

    return Column(
      children: [
        SizedBox(
          height: 440,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 10),
                    child: Text(
                      'Daftar Favorite:',
                      style: GoogleFonts.biryani(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children:
                        List.generate(prov.coffee1['data'].length, (index) {
                      var item = prov.coffee1['data'][index];
                      return Container(
                        height: 125,
                        child: Card(
                          color: Color.fromARGB(234, 233, 233, 1000),
                          clipBehavior: Clip.antiAlias,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 75,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              item['img'].toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    isThreeLine: true,
                                    subtitle: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            item['nama'].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Rp. ${item['price']}',
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color.fromARGB(
                                                255,
                                                75,
                                                8,
                                                8,
                                              ),
                                            ),
                                            width: 108,
                                            height: 45,
                                            child: Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        alignment:
                                                            PlaceholderAlignment
                                                                .middle,
                                                        child: IconButton(
                                                          color: Colors.white,
                                                          onPressed: () {
                                                            setState(() {
                                                              prov.totMinHarga(
                                                                  index);
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.remove),
                                                          iconSize: 16,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: prov
                                                            .coffee1['data']
                                                                [index]['total']
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      WidgetSpan(
                                                        alignment:
                                                            PlaceholderAlignment
                                                                .middle,
                                                        child: IconButton(
                                                          color: Colors.white,
                                                          onPressed: () {
                                                            setState(() {
                                                              prov.totHarga(
                                                                  index);
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.add),
                                                          iconSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 100),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 7),
                                          child: RatingBar(
                                            minRating: 1,
                                            maxRating: 5,
                                            initialRating: 3,
                                            allowHalfRating: true,
                                            onRatingUpdate: (rating) {},
                                            itemSize: 25,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              empty: Icon(
                                                Icons.star,
                                                color: Colors.grey,
                                              ),
                                              half: Icon(
                                                Icons.star_half,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 88),
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
                style: GoogleFonts.biryani(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
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
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Total Pesanan',
                      style: GoogleFonts.beVietnamPro(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Rp.${prov.getTotalPrice()}    ',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      "Pesan Sekarang",
                      style: GoogleFonts.biryani(),
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
    );
  }
}
