import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const PaymentTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selected ? Color(0xFF00897B) : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title),
        trailing: selected
            ? const Icon(Icons.check_circle,
            color: Color(0xFF00897B))
            : null,
        onTap: onTap,
      ),
    );
  }
}