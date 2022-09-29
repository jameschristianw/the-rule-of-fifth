import "package:flutter/material.dart";

class ItemSelection extends StatelessWidget {
  final String note;
  final Function onTap;

  const ItemSelection({super.key, required this.note, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: MediaQuery.of(context).size.width / 4,
        width: MediaQuery.of(context).size.width / 3,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber.shade400,
        ),
        child: Center(
            child: Text(
          note,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        )),
      ),
    );
  }
}
