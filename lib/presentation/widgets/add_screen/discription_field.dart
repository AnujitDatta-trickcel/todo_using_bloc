import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required TextEditingController descriptionTEC,
  }) : _descriptionTEC = descriptionTEC;

  final TextEditingController _descriptionTEC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _descriptionTEC,
      minLines: 3,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "Todo Description",
        border: OutlineInputBorder(),
      ),
    );
  }
}
