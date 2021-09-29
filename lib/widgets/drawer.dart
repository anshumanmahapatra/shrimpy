import 'package:flutter/material.dart';
import 'package:shrimpy/screens/information/info.dart';
import 'package:shrimpy/screens/marketing/marketing.dart';
import 'package:shrimpy/screens/messaging/inbox.dart';
import 'package:shrimpy/screens/profile/profile.dart';

class DrawerHelpers {
  showDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: const Text(
                  "Shrimpy",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(
                  Icons.article,
                  size: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Information Page',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Info()));
            },
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(
                  Icons.forum,
                  size: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 220,
                    child: Text(
                      'Marketing',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Marketing()));
            },
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(
                  Icons.message,
                  size: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Inbox()));
            },
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(
                  Icons.analytics,
                  size: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 220,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(
                  Icons.settings,
                  size: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Terms of Use",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
