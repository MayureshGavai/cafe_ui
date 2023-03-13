import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTile(
      {required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 5.0, bottom: 30),
      child: Container(
        height: 300,
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //coffee image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeeImagePath),
            ),

            //coffee name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 3),
                  Text('With Almond Milk',
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),

            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\₹ ' + coffeePrice,
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
