import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String blobURL =
      "http://vcloud.mangoitsol.com/5b4dcaca-724a-41f0-b1fe-959c72d73823";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blob URL Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _downloadBlobURL(blobURL, 'dart_test.pdf'),
          child: Text('Download File'),
        ),
      ),
    );
  }

  Future<void> _downloadBlobURL(String url, String fileName) async {
    try {
      if (await canLaunch(url)) {
        // final response = await Dio().get<List<int>>(
        //   url,
        //   options: Options(responseType: ResponseType.bytes),
        // );

        // final Uint8List uint8List = Uint8List.fromList(response.data!);

        String blobContent = "YOUR_BLOB_CONTENT";

        // Convert the blob content from base64 to bytes
        Uint8List fileBytes =
            Uint8List.fromList(List<int>.from(blobContent.codeUnits));

        final Directory directory = await getApplicationDocumentsDirectory();
        final File file = File('${directory.path}/$fileName');

        await file.writeAsBytes(fileBytes);
        print(file.path);

        await launch(file.path);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }
}
