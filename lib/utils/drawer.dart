import 'package:flutter/material.dart';
import 'package:recipes_app/screens/bookmark.dart';
import 'package:recipes_app/screens/create.dart';
import 'package:recipes_app/screens/home.dart';
import 'package:recipes_app/screens/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Image.asset('assets/images/food.jpg'),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
          ),
          ListTile(
            title: const Text(
              "Create",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePage(),
                  ));
            },
          ),
          ListTile(
            title: const Text(
              "BookMark",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookmarkPage(),
                  ));
            },
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
