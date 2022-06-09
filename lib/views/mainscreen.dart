import 'package:flutter/material.dart';
import 'package:slumshop/models/admin.dart';
import 'package:slumshop/views/newproduct.dart';

class MainScreen extends StatefulWidget {
  final Admin admin;
  const MainScreen({Key? key, required this.admin}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SlumShop'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.admin.name.toString()),
            accountEmail: Text(widget.admin.email.toString()),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdna.artstation.com/p/assets/images/images/033/435/166/medium/rishav-gupta-naruto.jpg?1609603275'),
            ),
          ),
          _createDrawerItem(
            icon: Icons.tv,
            text: 'My Dashboard',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MainScreen(
                            admin: widget.admin,
                          )));
            },
          ),
          _createDrawerItem(
            icon: Icons.list_alt,
            text: 'My Products',
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => ProductScreen(
              //               admin: widget.admin,
              //             )));
            },
          ),
          _createDrawerItem(
            icon: Icons.local_shipping_outlined,
            text: 'My Orders',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.supervised_user_circle,
            text: 'My Customer',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.verified_user,
            text: 'My Profile',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.file_copy,
            text: 'My Report',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () {},
          ),
        ],
      )),
      body: const Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "New Product",
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (content) => NewProduct()));
          // _loadProducts(1, '');
        },
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
