import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class MyTextField extends StatefulWidget {
  String title;
  String hint;
  Color titleColor;
  BorderSide borderSide;
  TextInputType inputType;
  bool securedPassword;
  VoidCallback? saveEditClick;
  bool editable;
  Validator? validator;
  TextEditingController? controller;

  MyTextField({
    super.key,
    required this.hint,
    required this.title,
    required this.inputType,
    this.titleColor = Colors.white,
    this.editable = true,
    this.securedPassword = false,
    this.borderSide = BorderSide.none,
    this.saveEditClick,
    this.controller,
    this.validator,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    isVisible = widget.securedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: widget.titleColor, fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: TextFormField(
            readOnly: !widget.editable,
            validator: widget.validator,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 20),
              errorStyle: TextStyle(fontSize: 20),
              prefixIcon:
                  widget.editable
                      ? InkWell(
                        onTap: widget.saveEditClick,
                        child: Icon(Icons.check),
                      )
                      : null,
              suffixIcon:
                  !widget.editable
                      ? InkWell(
                        onTap: () {
                          setState(() {
                            widget.editable = !widget.editable;
                          });
                        },
                        child: ImageIcon(
                          AssetImage('assets/images/edit_icon.png'),
                        ),
                      )
                      : widget.securedPassword
                      ? InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                        ),
                      )
                      : null,
              border: OutlineInputBorder(
                borderSide: widget.borderSide,
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: widget.borderSide,
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: widget.borderSide,
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hint,
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
            ),
            keyboardType: widget.inputType,
            obscureText: isVisible,
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}
