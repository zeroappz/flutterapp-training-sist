import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text("Courses"),
            leading: Icon(Icons.school),
          ),
          ListTile(
            title: Text("My Profile"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Terms & Conditions"),
            leading: Icon(Icons.book),
          ),
          ListTile(
            title: Text("Privacy Policy"),
            leading: Icon(Icons.file_download),
          ),
          Divider(
            color: Colors.black38,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
