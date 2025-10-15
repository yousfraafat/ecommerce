import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  String? loadingMessage;

  LoadingStateWidget({this.loadingMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator(), Text(loadingMessage ?? '')],
    );
  }
}
