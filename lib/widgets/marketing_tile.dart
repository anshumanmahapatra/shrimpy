import 'package:flutter/material.dart';
import 'package:shrimpy/constants/marketing_constant.dart';

class MarketingTile extends StatelessWidget {
  final MarketingConstant marketingConstant;
  const MarketingTile({Key? key, required this.marketingConstant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                marketingConstant.url,
                fit: BoxFit.contain,
              )),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset("assets/images/shrimp.png",
                              width: 35, height: 35)),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Text(
                          marketingConstant.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: const Text(
                            "Due in 2-3 days",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketingConstant.stars,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.lightBlue,
                              );
                            }),
                        const SizedBox(width: 5),
                        Text(
                          "(" + marketingConstant.rating.toString() + ")",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.blue,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total: " +
                                    marketingConstant.total.toString() +
                                    " Quintal",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rs. " +
                                    marketingConstant.price.toString() +
                                    " / Quintal",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: const CircleAvatar(
                                  child: Icon(Icons.person))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                marketingConstant.seller,
                              ),
                              Text(marketingConstant.address)
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("MORE DETAILS"),
                    ),
                    ElevatedButton(
                      child: const Text("PRE-ORDER"),
                      onPressed: () {},
                    )
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
