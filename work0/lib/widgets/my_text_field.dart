import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String label;
  final Function(String)? onChanged;
  const MyTextField({
    Key? key,
    required this.hint,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.abc),
        hintText: hint,
        labelText: label,
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      /* validator: (String? value) {
       return (value != null && value.contains('@'))
           ? 'Do not use the @ char.'
           : null;
     }, */
    );
  }
}
