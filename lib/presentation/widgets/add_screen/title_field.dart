import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required TextEditingController titleTEC,
  }) : _titleTEC = titleTEC;

  final TextEditingController _titleTEC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleTEC,
      decoration: const InputDecoration(
        labelText: "Title",
        border: OutlineInputBorder(),
      ),
      validator: (text) {
        if (text == null || text == '') {
          return "Title can't be empty";
        } else {
          return null;
        }
      },
    );
  }
}
