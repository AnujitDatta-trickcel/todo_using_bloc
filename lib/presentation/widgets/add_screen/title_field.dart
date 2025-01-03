import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'title',
      decoration: const InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }
}
