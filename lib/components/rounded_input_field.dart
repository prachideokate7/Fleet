import 'package:flutter/material.dart';
import 'text_field_container.dart';

import '../constants.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person, required this.controller,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child : TextFormField(
          controller: controller,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none
          ),
        )
     );
  }
}