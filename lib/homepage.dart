import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: import images

  AssetImage circle = AssetImage('assets/images/circle.png');
  AssetImage lucky = AssetImage('assets/images/lucky.png');
  AssetImage unlucky = AssetImage('assets/images/unlucky.png');

  //TODO: get an array

  List<String> itemArray;
  int luckyNumber;

  //TODO: initialize your array with 25 elements

  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => 'empty');
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(10);
    setState(() {
      luckyNumber = random;
    });
  }

  //TODO: define a getImage method.

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case 'lucky':
        return lucky;
        break;
      case 'unlucky':
        return unlucky;
        break;
    }
    return circle;
  }

  //TODO: play game method

  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = 'lucky';
      });
    } else {
      setState(() {
        itemArray[index] = 'unlucky';
      });
    }
  }

  //TODO: showAll

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, 'unlucky');
      itemArray[luckyNumber] = 'lucky';
    });
  }

  //TODO: Reset all

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, 'empty');
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch And Win'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, index) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(index);
                  },
                  child: Image(
                    image: this.getImage(index),
                  ),
                  color: Colors.pink[100],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: () {
                this.showAll();
              },
              child: Text(
                'Show All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: () {
                this.resetGame();
              },
              child: Text(
                'Reset Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
