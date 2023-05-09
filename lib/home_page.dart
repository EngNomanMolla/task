import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define the input data as static variables
  final data1 =
      '{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}}';
  final data2 =
      '{"0":{"id":8,"title":"Froyo"},"2":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}}';
  final data3 =
      '[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]';

  // Define the function to parse the JSON
  List<AndroidVersion> parseJson(String jsonString) {
    final parsedData = json.decode(jsonString);
    final androidVersions = <AndroidVersion>[];
    if (parsedData != null) {
      parsedData.forEach((key, value) {

          final version = AndroidVersion(value['id'], value['title']);
          androidVersions.add(version);

      });

    }
    return androidVersions;
  }


  // Define the function to search for a version by ID
  String? searchById(List<AndroidVersion> androidVersions, int id) {
    for (final version in androidVersions) {
      if (version.id == id) {
        return version.title;
      }
    }
    return null; // ID not found
  }

  @override
  Widget build(BuildContext context) {

    final androidVersions1 = parseJson(data1);
    final androidVersions2 = parseJson(data2);
    //final androidVersions3 = parseJson(data3);


    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(searchById(androidVersions1, 1).toString()),
                Text(searchById(androidVersions1, 2).toString()),
                Text(searchById(androidVersions1, 3).toString()),
              ],
            ),



          ],
        ),
      ),
    );
  }
}

class AndroidVersion {
  final int id;
  final String title;

  AndroidVersion(this.id, this.title);

  @override
  String toString() {
    return 'ID: $id, Title: $title';
  }
}
