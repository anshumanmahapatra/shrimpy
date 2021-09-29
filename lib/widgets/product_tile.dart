import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shrimpy/constants/products.dart';

class ProductTile {
  buildProductGrid(BuildContext context, Product product) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 5,
                  child: Image.network(
                    product.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Text(
                                product.title.toString(),
                              )),
                          const Expanded(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.cartPlus,
                              size: 25,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Rs." + product.cost.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.discount.toString() + "% off",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.stars,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              );
                            }),
                        const SizedBox(width: 5),
                        Text(
                          "(" + product.rating.toString() + ")",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: const FaIcon(FontAwesomeIcons.heart)),
            ),
          ],
        ),
      ),
    ));
  }
}
