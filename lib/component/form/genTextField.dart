import 'package:flutter/material.dart';

class GenTextFieldRoundedBorder extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? init;
  final TextInputType? type;
  final Function(String) onChange;



  const GenTextFieldRoundedBorder({Key? key, required this.label, required this.hint,  this.type = TextInputType.text, required this.onChange, this.init}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: init ?? "",
      keyboardType: type,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),

      onChanged: onChange,
    );
  }
}
