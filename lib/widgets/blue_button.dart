import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const BlueButton({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: onPressed,
      disabledColor: Colors.grey,
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
