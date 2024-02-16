import 'package:flutter/material.dart';
import 'package:tarea_3/singletons/selected.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                const TopText(),
                SizedBox(height: constraints.maxHeight * 0.03),
                const FoodList(),
                const Buttons(),
              ],
            );
          }),
        ),
      );
    });
  }
}

class TopText extends StatelessWidget {
  const TopText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: const Text(
          "Explore the restaurant's delicious menu items below!",
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}

class FoodList extends StatefulWidget {
  const FoodList({
    super.key,
  });

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              selectedData.selected =
                  selectedData.selected == "Burger" ? "" : "Burger";
            });
          },
          leading: Image.asset('assets/images/hamburger.png'),
          title: const Text('Burger'),
          tileColor:
              selectedData.selected == "Burger" ? Colors.blue[300] : null,
        ),
        ListTile(
          onTap: () {
            setState(() {
              selectedData.selected =
                  selectedData.selected == "Hot Dog" ? "" : "Hot Dog";
            });
          },
          leading: Image.asset('assets/images/hot-dog.png'),
          title: const Text('Hot Dog'),
          tileColor:
              selectedData.selected == "Hot Dog" ? Colors.blue[300] : null,
        ),
        ListTile(
          onTap: () {
            setState(() {
              selectedData.selected =
                  selectedData.selected == "Fries" ? "" : "Fries";
            });
          },
          leading: Image.asset('assets/images/french-fries.png'),
          title: const Text('Fries'),
          tileColor: selectedData.selected == "Fries" ? Colors.blue[300] : null,
        ),
        ListTile(
          onTap: () {
            setState(() {
              selectedData.selected =
                  selectedData.selected == "Soda" ? "" : "Soda";
            });
          },
          leading: Image.asset('assets/images/can.png'),
          title: const Text('Soda'),
          tileColor: selectedData.selected == "Soda" ? Colors.blue[300] : null,
        ),
        ListTile(
          onTap: () {
            setState(() {
              selectedData.selected =
                  selectedData.selected == "Ice Cream" ? "" : "Ice Cream";
            });
          },
          leading: Image.asset('assets/images/ice-cream.png'),
          title: const Text('Ice Cream'),
          tileColor:
              selectedData.selected == "Ice Cream" ? Colors.blue[300] : null,
        ),
      ],
    ));
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            // Color gray and square corners
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              // Show dialog with the title "Pickup" and the selected item
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pickup'),
                    content: Text((selectedData.selected == "")
                        ? "Nothing selected"
                        : 'You have selected: ${selectedData.selected}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pickup'),
          ),
          const VerticalDivider(
            color: Colors.grey,
            width: 20,
            thickness: 2,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delivery'),
                    content: Text((selectedData.selected == "")
                        ? "Nothing selected"
                        : 'You have selected: ${selectedData.selected}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Delivery'),
          ),
        ],
      ),
    );
  }
}
