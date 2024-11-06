import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPasswordField;

  const TextForm({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPasswordField ? _obscureText : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Icon(
                  widget.icon,
                  color: Colors.grey[600],
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorStyle: TextStyle(color: Colors.red, fontSize: 15),
        ),
        validator: widget.validator,
      ),
    );
  }
}
