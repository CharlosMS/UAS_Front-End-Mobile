import 'package:flutter/material.dart';

class Profiledit extends StatefulWidget {
  const Profiledit({super.key});

  @override
  State<Profiledit> createState() => _ProfileditState();
}

class _ProfileditState extends State<Profiledit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 15),
              height: 120,
              width: 120,
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/profile.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            textField("Masukkan Nama Anda", "Nama"),
            textField("Masukkan Email Anda", "Email"),
            textField("Masukkan Nomor HP Anda", "No Hp"),
            textField("Masukkan Alamat Anda", "Alamat"),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 35),
                    backgroundColor: Color.fromARGB(255, 75, 8, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(showBanner(context)),
                child: Text("Simpan"),
              ),
            )
          ],
        ),
      ),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
      content: Text("Data berhasil disimpan"),
      leading: Icon(
        Icons.check,
        color: Colors.green,
      ),
      actions: [
        TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: Text("Yes"))
      ],
    );
  }

  Widget textField(String hint, String title) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: TextFormField(
            cursorColor: Color.fromARGB(255, 85, 49, 3),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: "NexaBold",
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
