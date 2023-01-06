import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/karakter.dart';

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
    return Container(
      width: 500,
      height: 500,
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.only(top: 10),
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
              // ignore: prefer_const_constructors
              image: DecorationImage(
                image: const AssetImage('assets/images/dobby.jpg'),
                /*image: NetworkImage('_dobby'),*/
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildText("name: ", char.name),
          buildText("species: ", char.species),
          buildText("gender: ", char.gender),
          buildText("yearOfBirth: ", char.yearOfBirth.toString()),
          buildText("actor: ", char.actor),
        ],
      ),
    );
  }

  Widget buildText(String str, dynamic str2) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(
          '$str  $str2',
          style: const TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
