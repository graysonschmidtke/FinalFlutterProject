import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String studentName = "Grayson Schmidtke";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dogMessage = '';
  int randomNumber = 1;

  @override
  void initState() {
    super.initState();
    randomNumber = getRandomNumber();
    dogMessage = getDogMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.studentName + "'s Dog App"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Happy Day!",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 40.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Dog:",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(getImageFileName()),
              ),
            ),
            Text(
              getDogName(),
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getSubtitleName(),
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.announcement,
                  color: Colors.teal,
                ),
                title: Text(
                  dogMessage,
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  randomNumber = getRandomNumber();
                  dogMessage = getDogMessage();
                });
              },
              child: Text('Random'),
            ),
          ],
        ),
      ),
    );
  }

  int getRandomNumber() {
    return Random().nextInt(5);
  }


  String getImageFileName() {
    List<String> imageStrArr = [
      'images/bulldog.jpg',
      'images/german.jpg',
      'images/golden.jpg',
      'images/poodle.jpg',
      'images/rottweiler.jpg',
    ];
    return imageStrArr[randomNumber % imageStrArr.length];
  }

  String getDogName() {
    String imageString = getImageFileName();
    String dogName = imageString.split('/').last.split('.').first;
    return dogName[0].toUpperCase() + dogName.substring(1);
  }

  String getSubtitleName() {
    List<String> dogSubtitleStrArr = [
      'Small',
      'Medium-Large',
      'Medium',
      'Medium',
      'Large'
    ];
    return dogSubtitleStrArr[randomNumber % dogSubtitleStrArr.length];
  }

  String getDogMessage() {
    List<String> dogNameStrArr = [
      'Bulldogs have a distinctive pushed-in nose and wrinkled face, making them prone to snoring and drooling.',
      'German Shepherds are highly intelligent and versatile dogs, often used as police dogs, search and rescue dogs, and guide dogs for the visually impaired.',
      'Golden Retrievers are known for their friendly and gentle temperament, making them excellent family pets and therapy dogs.',
      'Poodles are one of the most intelligent dog breeds and come in three sizes: standard, miniature, and toy. They are also hypoallergenic, making them a popular choice for people with allergies.',
      'Rottweilers are powerful and loyal dogs with a natural instinct to protect their families. With proper training and socialization, they can be affectionate companions.'
    ];
    return dogNameStrArr[randomNumber % dogNameStrArr.length];
  }
}
