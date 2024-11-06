import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function(BuildContext) navigator;

  CustomTextButton({Key? key, required this.text, required this.navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  navigator(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}
