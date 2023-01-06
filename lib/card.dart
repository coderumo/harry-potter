import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/color_constants.dart';
import 'package:harry_potter/karakter.dart';
import 'package:harry_potter/kullaniciProfilli.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<Karakter>> _getCharList() async {
    try {
      var response =
          await Dio().get('https://hp-api.onrender.com/api/characters');
      List<Karakter> _charList = [];
      if (response.statusCode == 200) {
        _charList =
            (response.data as List).map((e) => Karakter.fromMap(e)).toList();
        debugPrint(_charList[110].name);
      }
      return _charList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getCharList();
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Karakter>>(
            future: _getCharList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var charList = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var char = charList[110];
                    return CharCard(char: char);
                  },
                  itemCount: 1,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

class CharCard extends StatelessWidget {
  const CharCard({
    Key? key,
    required this.char,
  }) : super(key: key);

  final Karakter char;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      color: ColorConstants.blue4,
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(170),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: ColorConstants.black.withOpacity(0.5),
                    )
                  ],
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                    image: const AssetImage('assets/images/dobby.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: buildText("name: ", char.name)),
          Expanded(child: buildText("species: ", char.species)),
          Expanded(child: buildText("gender: ", char.gender)),
          Expanded(child: buildText("eyeColor: ", char.eyeColour)),
          Expanded(child: buildText("actor: ", char.actor)),
          Expanded(child: buildText("wizard: ", char.wizard)),
          Expanded(
              child: buildText("hogwarts Student: ", char.hogwartsStudent)),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, top: 140),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.blue1,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const KullaniciProfili()));
              },
              child: const Text(
                "Profil Sayfama Git",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String str, dynamic str2) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        children: [
          Text(
            '$str',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${str2.toString()}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ));
  }
}
