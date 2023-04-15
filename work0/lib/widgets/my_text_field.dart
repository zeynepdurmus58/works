// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class MyTextField  extends StatefulWidget {
  final String hint;
  final String label;
  final bool passwd;
  final bool number;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  
  const MyTextField({
    Key? key,
    required this.hint,
    this.passwd = false,
    this.number = false,
    this.onChanged,
    required this.controller, required this.label,
    this.validator,
    
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField > {
  bool unlocked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.passwd && !unlocked,
        keyboardType: widget.number ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.abc),
          hintText: widget.hint,
          labelText: widget.label,
          filled: true,
          suffixIcon: widget.passwd
              ? unlocked
                ? IconButton(
                      icon: const Icon(Icons.lock),
                      onPressed: () {
                        setState(() {
                          unlocked = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        print('unlocking...');
                        setState(() {
                          unlocked = true;
                        });
                      },
                    )
              : null,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
           contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 5,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                ),
          ),
        ),
        //onSaved: (String? value) {},
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}