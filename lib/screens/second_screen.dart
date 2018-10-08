import "package:flutter/material.dart";

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>  with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  Animation<double> _animationTop;
  AnimationController _animationController;

  @override
  void initState() {
    // initializing state
    super.initState();
    // setting animation controller with duration 2.5 seconds
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Setting Tween animation for opacity between 0.0 & 1.0
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationTop = Tween(begin: 5.0, end: 0.0).animate(_animationController)
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
          // ===================== Play Again button ===================== //
          _buildPlayAgainButton(context),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // ===================== Cube left ===================== //
          Opacity(
            opacity: _animation.value,
            child: Image.asset(
              "assets/images/changefly-cube-left.png",
            ),
          ),
          // ===================== Cube Right ===================== //
          Opacity(
            opacity: _animation.value,
            child: Image.asset(
              "assets/images/changefly-cube-right.png",
            ),
          ),
          // ===================== Cube Top ===================== //
          Opacity(
            opacity: _animation.value,
            child: Transform(
              transform: Matrix4.rotationX(_animationTop.value),
              child: Image.asset(
                "assets/images/changefly-cube-top.png",
              ),
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
