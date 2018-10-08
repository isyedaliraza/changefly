import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

import "second_screen.dart";

/// HomeScreen widget. This widget represents home screen of app.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// HomeScreen widget's state.
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  Animation<double> _animationTop; // animation for top cube
  Animation<double> _animationLeft; // animation for left cube
  Animation<double> _animationRight; // animation for right cube
  AnimationController _animationController;

  @override
  void initState() {
    // initializing state
    super.initState();
    // setting animation controller with duration 1.5 seconds
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    // Setting Tween animation for top cube between 0.0 & 150.0
    _animationTop = Tween(begin: 0.0, end: 150.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    // Setting Tween animation for left cube between -100.0 & 0.0
    _animationLeft =
        Tween(begin: -100.0, end: 0.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    // Setting Tween animation for right cube between 100.0 & 0.0
    _animationRight =
        Tween(begin: 100.0, end: 0.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    // starting the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // ===================== Second screen button ===================== //
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => SecondScreen(),
              ));
            },
            textColor: Colors.white,
            child: Text(
              "Second Screen",
            ),
          ),
          // ===================== Play Again button ===================== //
          _buildPlayAgainButton(context),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // ===================== Cube left ===================== //
          Transform(
            transform:
                Matrix4.translationValues(_animationLeft.value, 150.0, 0.0),
            child: Image.asset(
              "assets/images/changefly-cube-left.png",
            ),
          ),
          // ===================== Cube Right ===================== //
          Transform(
            transform:
                Matrix4.translationValues(_animationRight.value, 150.0, 0.0),
            child: Image.asset(
              "assets/images/changefly-cube-right.png",
            ),
          ),
          // ===================== Cube Top ===================== //
          Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.translationValues(0.0, _animationTop.value, 0.0),
            child: Image.asset(
              "assets/images/changefly-cube-top.png",
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // disposing the animation controller
    _animationController.dispose();
    super.dispose();
  }

  /// play again button builder method returns a play again button
  _buildPlayAgainButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        // reset the controller and play again
        _animationController.reset();
        _animationController.forward();
      },
      icon: Icon(Icons.replay),
      tooltip: "Play again",
    );
  }
}
