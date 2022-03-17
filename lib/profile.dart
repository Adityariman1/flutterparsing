import 'dart:convert';

import 'package:penjualanbuku/_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: profilePage(),
    );
  }
}

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      _name = sample.name.toString();
      _age = sample.age.toString();
      _gender = sample.gender.toString();
      _hobi = sample.hobi.toString();
    });
  }

  late String _name = "";
  late String _age = "";
  late String _gender = "";
  late String _hobi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _loadSampleJson();
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      color: Colors.blueAccent,
                      alignment: Alignment.center,
                      child: const Text("Read JSON File"),
                    ),
                  ),
                ],
              ),
              Container(
                width: 400,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                color: Colors.lightGreen,
                child: Column(
                  children: [
                    Text(
                      "Nama : " + _name,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Umur : " + _age,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Jenis Kelamin : " + _gender,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Hobi : " + _hobi,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}