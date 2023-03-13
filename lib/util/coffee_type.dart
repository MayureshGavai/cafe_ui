import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isselected;
  final VoidCallback onTap;

  CoffeeType(
      {required this.coffeeType,
      required this.isselected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 5.0),
        child: Text(coffeeType,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isselected ? Color.fromARGB(207, 196, 101, 24) : Colors.white)),
      ),
    );
  }
}
