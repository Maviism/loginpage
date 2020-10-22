import 'package:flutter/material.dart';

class SliverRemain extends StatelessWidget {
  SliverRemain({this.label, this.touchableText, this.onTap});

  final String label;
  final String touchableText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            GestureDetector(
              child: Text(
                touchableText,
                style: TextStyle(color: Colors.blue),
              ),
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
