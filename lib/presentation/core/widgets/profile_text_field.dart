import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class ProfileTextField extends StatefulWidget {
  String title;
  String hint;
  TextInputType inputType;
  bool securedPassword;
  Validator? validator;
  TextEditingController? controller;

  ProfileTextField({
    super.key,
    required this.hint,
    required this.title,
    required this.inputType,
    this.securedPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool isVisible = true;
  bool isEditable = false;

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
        Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 20)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: TextFormField(
            readOnly: !isEditable,
            validator: widget.validator,
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 20),
              prefixIcon:
                  isEditable
                      ? InkWell(
                        onTap: () {
                          setState(() {
                            isEditable = !isEditable;
                          });
                        },
                        child: Icon(Icons.check),
                      )
                      : null,
              suffixIcon:
                  !isEditable
                      ? InkWell(
                        onTap: () {
                          setState(() {
                            isEditable = !isEditable;
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(Icons.edit),
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
                borderSide: BorderSide(color: MyApp.mainColor),
                borderRadius: BorderRadius.circular(15),
              ),
              // filled: true,
              // fillColor: Colors.white,
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
