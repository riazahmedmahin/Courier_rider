import 'package:flutter/material.dart';


class navbuttom extends StatelessWidget {
  const navbuttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      //elevation: 2,
      shape: CircularNotchedRectangle(), // Bottom bar shape with a notch
      notchMargin: 8.0, // Margin for the notch
      child: Container(
        height: 60.0, // Height of the bottom navigation bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[],
        ),
      ),
    );
  }
}
