import 'package:flutter/material.dart';
import 'package:project_uas/cartpage/cartpage_provider.dart';
import 'package:project_uas/paymentpage/hasilpesan_screen.dart';

import 'package:provider/provider.dart';

class Keranjang_Screen extends StatefulWidget {
  const Keranjang_Screen({super.key});

  @override
  State<Keranjang_Screen> createState() => _Keranjang_ScreenState();
}

class _Keranjang_ScreenState extends State<Keranjang_Screen> {
  TextEditingController? _time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Keranjang'),
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final prov = Provider.of<CartPageProvider>(context);

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '   Informasi Pemesan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '      Nomor Meja',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 64, 128, 180)),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '      Catatan',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 64, 128, 180)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '   Daftar Pesanan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Column(
                      children:
                          List.generate(prov.pesanan['data'].length, (index) {
                        var item = prov.pesanan['data'][index];
                        return Card(
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
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Text(
                                          item['nama'].toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          'Rp. ${item['price']}',
                                          style: const TextStyle(
                                            color: Colors.black87,
                                          ),
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
                                          width: 92,
                                          height: 40,
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    WidgetSpan(
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
                                                      text: prov.pesanan['data']
                                                              [index]['total']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    WidgetSpan(
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
                                                        iconSize: 15,
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
                                  trailing: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
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
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 133, 131, 131),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Pesanan",
                style: TextStyle(
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
                  const Text(
                    '    Jumlah Item',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${prov.getTotalItems()} Item    ',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '    Total Pesanan',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Rp.${prov.getTotalPrice()}    ',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '    Jam: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                    onPressed: () {},
                    child: const Text("Sekarang"),
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
                          _time =
                              TextEditingController(text: res.format(context));
                        });
                      }
                      ;
                      Route route =
                          MaterialPageRoute(builder: (context) => HasilPesan());
                      Navigator.push(context, route);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.timer),
                        Text('  Nanti'),
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
    );
  }
}
