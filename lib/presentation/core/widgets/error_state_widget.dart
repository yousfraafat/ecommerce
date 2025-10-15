import 'dart:async';
import 'dart:io';

import 'package:ecommerce/domain/result.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  Exception? exception;
  VoidCallback? retryPress;
  String retryText;

  ErrorStateWidget({
    this.exception,
    this.retryPress,
    this.retryText = 'try again',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(extractErrorMessage()),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyApp.mainColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            retryPress;
          },
          child: Text(retryText),
        ),
      ],
    );
  }

  String extractErrorMessage() {
    switch (exception) {
      case TimeoutException():
        {
          return 'check internet connection';
        }
      case SocketException():
        {
          return 'check internet connection';
        }
      case ServerErrorException():
        {
          exception as ServerErrorException;
          return (exception as ServerErrorException).message ?? 'server error';
        }
      default:
        {
          return 'something went wrong';
        }
    }
  }
}
