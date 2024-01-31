import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

final randomize = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  // var activeDiseValue = "assets/images/dice-2.png";
  var current = 2;

  void rollDice() {
    setState(() {
      String imageUrl =
          "http://vcloud.mangoitsol.com/a9baacff-c43d-4ffa-8612-5c90b41930ec";

      // Convert the string to a list of integers (ASCII values)
      List<int> imageUrlBytes = utf8.encode(imageUrl);

      // Encode the list of integers as a base64 string
      String base64Image = base64Encode(imageUrlBytes);

      print(base64Image);

      String base64String = base64Image;
      String fileName =
          "filename.pdf"; // Provide the desired file name with the appropriate extension

      // Decode the base64 string to bytes
      List<int> fileBytes = base64Decode(base64String);

      // Get the application documents directory
      // Build the full file path
      String filePath = "./";

      // Write the bytes to a file
      File(filePath).writeAsBytesSync(fileBytes);

      print("File downloaded successfully at $filePath");

      current = randomize.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$current.png",
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(30),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
