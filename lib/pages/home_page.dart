import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/components/consts.dart';
import 'package:sneaker_shop/pages/cart_page.dart';
import 'package:sneaker_shop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // this selected index is to control the button nav bar
  int _selectedIndex = 0;

  // this method will update out selected index
  //when the user taps on the bottom bar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //shop page
    const ShopPage(),
    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (int index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, 
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
           Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               //logo
            DrawerHeader(
              child: Image.asset(
                AppImages.nikeLogo,
              ),
            ),
            
            //other pages
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              
            ),
             Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              
            ),
             Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ],
           )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}