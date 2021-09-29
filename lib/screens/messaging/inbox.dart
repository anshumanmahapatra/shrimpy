import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'message.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.message),
            onPressed: () {},
          ),
          appBar: AppBar(
            title: const Text("Messages"),
            elevation: 0,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(text: "Calls"),
              ],
            ),
            actions: const [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ListView(children: [
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Sea Gold Overseas LTD"),
                      Text(
                        "04 : 23 PM",
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rs. 50,000 fixed"),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Text("2",
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Falcon Marine"),
                      Text(
                        "12 : 47 PM",
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Can we settle the deal at Rs. 60,000..."),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Text("1",
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("S.S. Aqua and Harvest"),
                      Text(
                        "09 : 30 AM",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.checkDouble,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sorry but not less than Rs. 40,000..."),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Message()));
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Latika Sea Food LTD"),
                      Text(
                        "Yesterday",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.checkDouble,
                        size: 15,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 5),
                      Text("Ok Deal Final"),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                child: Text("Empty"),
              )
            ],
          )),
    );
  }
}
