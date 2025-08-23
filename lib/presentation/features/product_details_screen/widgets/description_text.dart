import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  final String text;
  final int lines;

  const DescriptionText({Key? key, required this.text, this.lines = 3})
    : super(key: key);

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: DefaultTextStyle.of(context).style,
      ),
      maxLines: widget.lines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    if (!textPainter.didExceedMaxLines && !isExpanded) {
      return Text(widget.text);
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: isExpanded ? widget.text : _getTrimmedText(),
            style: DefaultTextStyle.of(context).style,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Read Less' : '...Read More',
                style: const TextStyle(
                  color: MyApp.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTrimmedText() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: DefaultTextStyle.of(context).style,
      ),
      maxLines: widget.lines,

      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final position = textPainter.getPositionForOffset(
      Offset(textPainter.width, textPainter.height),
    );
    final endIndex = textPainter.getOffsetBefore(position.offset) ?? 0;

    return widget.text.substring(0, endIndex);
  }
}
