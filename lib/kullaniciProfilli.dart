import 'package:flutter/material.dart';

class KullaniciProfili extends StatefulWidget {
  const KullaniciProfili({super.key});

  @override
  State<KullaniciProfili> createState() => _KullaniciProfiliState();
}

class _KullaniciProfiliState extends State<KullaniciProfili> {
  String img =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsdaiDNdvtaw92OSWza-naWn9LXhJOGvJ8-w&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumeysa ALKAYA'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
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
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              buildText("name", "rumeysa alkaya"),
              buildText("age", "21"),
              buildText("school", "Ondokuz Mayıs Universty"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText(String labelText, String placeHolder) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
