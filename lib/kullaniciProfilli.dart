// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harry_potter/color_constants.dart';

class KullaniciProfili extends StatefulWidget {
  const KullaniciProfili({super.key});

  @override
  State<KullaniciProfili> createState() => _KullaniciProfiliState();
}

class _KullaniciProfiliState extends State<KullaniciProfili> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.blue1,
        title: const Text('Rumeysa ALKAYA'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        color: ColorConstants.blue4,
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(170),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                    image: const AssetImage('assets/images/pp.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            buildText2("Ad-Soyad ", "Rumeysa ALKAYA"),
            buildText2("Yaş", "21"),
            buildText2("Memleket", "Kahramanmaraş"),
            buildText2("OKul", "Ondokuz Mayıs Üniversitesi"),
            buildText2("Bölüm", "Bilgisayar Mühendisliği"),
            buildText2("Hobiler",
                "Resim çizmek, bulmaca çözmek, roman/şiir okumak, bisiklete binmek, "),
            Padding(
              padding: EdgeInsets.only(right: 80, left: 80, top: 35),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.blue1,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Dobby Kartına Git",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildText2(String str, dynamic str2) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        Text(
          " $str ",
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          "$str2",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        )
      ]),
    );
  }

  /*profil sayfası düzenleme aktif olursa bu widget kullanılır*/
/*   Widget buildText(String labelText, String placeHolder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            labelStyle: const TextStyle(fontSize: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  } */
}
