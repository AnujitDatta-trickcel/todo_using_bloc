import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'description',
      decoration: const InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      minLines: 5,
      maxLines: null,
    );
  }
}
