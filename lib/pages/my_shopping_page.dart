import 'package:flutter/material.dart';
import 'package:pdp_bazar_home/theme/color.dart';
import 'package:pdp_bazar_home/util/my_shopping_json.dart';

class MyShoppingPage extends StatefulWidget {
  const MyShoppingPage({Key? key}) : super(key: key);

  @override
  _MyShoppingPageState createState() => _MyShoppingPageState();
}

class _MyShoppingPageState extends State<MyShoppingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        const SizedBox(height: 20),
        const Text(
          "My Shopping",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        const SizedBox(height: 15),
        Column(
          children: List.generate(myShoppings.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: (size.width - 30) * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(myShoppings[index]['imageUrl']),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 110,
                    width: (size.width - 30) * 0.50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myShoppings[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${myShoppings[index]['price']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                            Text(
                              "x${myShoppings[index]['qty']}",
                              style: const TextStyle(fontSize: 13, color: grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Total",
              style: TextStyle(
                fontSize: 16,
                color: grey
              ),
            ),
            Text(
              "\$770.00",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {},
            child: SizedBox(
              height: 45,
              width: size.width * 0.35,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: blue
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: white
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}