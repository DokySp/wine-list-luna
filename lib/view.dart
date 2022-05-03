import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:universal_io/io.dart' as uio;

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  void initState() {
    super.initState();
    loader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

Future<void> loader() async {}

List<int> file = [];

Future<List<List<dynamic>>> resultToCsv(Object result) async {
  file = const Base64Decoder().convert(result.toString().split(",").last);
  String csvFileString = utf8.decode(file);

  List<List<dynamic>> rowsAsListOfValues =
      const CsvToListConverter().convert(csvFileString);

  return await Future.value(rowsAsListOfValues);
}
