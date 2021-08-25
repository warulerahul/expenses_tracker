import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String helperText;
  final IconData icon;
  final TextInputType textInputType;
  final bool isNumeric;
  const BuildTextField({
    Key key,
    this.controller,
    this.text,
    this.helperText,
    this.icon,
    this.isNumeric,
    this.textInputType,
  }) : super(key: key);

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    print("hi:-${widget.isNumeric}");
    return TextFormField(
      cursorColor: Colors.black,
      maxLength: widget.isNumeric ? 10 : 40,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(
          widget.icon,
          color: Colors.black,
        ),
        labelText: widget.text,
        suffixIcon: InkWell(
          onTap: () {
            widget.controller.clear();
          },
          child: Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFFF000000),
        ),
        helperText: widget.helperText,
      ),
    );
  }
}
