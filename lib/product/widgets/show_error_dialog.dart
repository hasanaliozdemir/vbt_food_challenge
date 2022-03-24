import 'package:flutter/material.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  String? message1,
  String? message2,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('HATA'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message1 ?? 'Bilinmeyen Bir Hata oluştu.'),
              Text(message2 ?? ''),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
