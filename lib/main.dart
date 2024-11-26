import 'dart:developer';

import 'package:flutter/material.dart';

// function to trigger app build
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: Text(
        'A drawer is an invisible side screen.',
        style: TextStyle(fontSize: 20.0),
      )),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Sunnat Amirov",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("sunnatbekamirov00@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile Screen"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.start,
            "Info screen bu user haqida ma'lumot beradi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 100,
            child: Icon(Icons.alarm),
          ),
          const Text("Men nimadur......."),
          const SizedBox(height: 20),
          // Row(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 10),
          //       child: Text(
          //         "Don't have an account?",
          //       ),
          //     ),
          //     Text(
          //       "Sign up",
          //       style: TextStyle(
          //         color: Colors.yellow,
          //         decoration: TextDecoration.underline,
          //         decorationColor: Colors.yellow,
          //       ),
          //     ),
          //   ],
          // ),

          // Richtext bilan misol
          RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: IconButton(
          tooltip: "Floating",
          onPressed: () {
            Navigator.pop(context);
            log("Floating action buttoni bosildi.Orqaga navigation qilinyapti.");
          },
          icon: Icon(
            size: 20,
            color: Colors.white,
            Icons.arrow_back_ios,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(items: [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        if (isAdmin)
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
                color: Colors.greenAccent,
              ),
              label: "Payment"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 100,
              color: Colors.orange,
            ),
            label: "Profile"),
      ]),
    );
  }
}
