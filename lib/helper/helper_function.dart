import 'package:flutter/material.dart';

// display error message to user
void displayErrorMesageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: Center(
        child: Text(message),
      ),
    ),
  );
}
