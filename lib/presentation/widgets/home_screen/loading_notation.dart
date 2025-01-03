import 'package:flutter/material.dart';

class LoadingNotation extends StatelessWidget {
  const LoadingNotation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
