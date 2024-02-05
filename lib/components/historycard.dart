import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final child;
  const HistoryCard({
    super.key,
    required this.child,
});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}
