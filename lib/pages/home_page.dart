import 'package:cafe_ui/util/coffe_tile.dart';
import 'package:cafe_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //list of coffee type
  final List coffeeType = [
    //[coffeetype, isSelected]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Cold Coffee',
      false,
    ],
    [
      'Ice Coffee',
      false,
    ],
    [
      'Black Coffee',
      false,
    ],
  ];

  //user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(207, 196, 101, 24),
          ),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded), label: ''),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: TextStyle(fontSize: 29),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
        ),
        SizedBox(height: 25),

        //horizontal listview for coffee types
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index) {
              return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isselected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  });
            },
          ),
        ),

        Container(
          height: 420,
          child: Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'asset/images/cappuccino.jpg',
                coffeeName: 'Cappuccino',
                coffeeSubtitle: 'With Almond Milk',
                coffeePrice: '99',
              ),
              CoffeeTile(
                coffeeImagePath: 'asset/images/espresso.jpg',
                coffeeName: 'Espresso',
                coffeeSubtitle: 'Made by Arabica beans',
                coffeePrice: '150',
              ),
              CoffeeTile(
                coffeeImagePath: 'asset/images/ice_coffee.jpg',
                coffeeName: 'Ice Coffee',
                coffeeSubtitle: 'With Vanilla Cream',
                coffeePrice: '130',
              ),
              CoffeeTile(
                coffeeImagePath: 'asset/images/latte.jpg',
                coffeeName: 'Latte',
                coffeeSubtitle: 'With Low Sugar',
                coffeePrice: '160',
              ),
            ],
          )),
        ),
      ]),
    );
  }
}
