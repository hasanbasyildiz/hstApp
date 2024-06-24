import 'package:apphst/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_pages/page1_istanbul.dart';
import 'bottom_navigation_pages/page2_ankara.dart';
import 'bottom_navigation_pages/page3_izmir.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var pageLists = [PageOne(), PageTwo(), PageThree()];
  int selectedIndex = 0;
  final firebaseAuth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Ana sayfa"),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
      ),
      drawer: NavigationDrawer(),
      //bottomNavigationBar:,
      body: pageLists[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.looks_one),
            label: "istanbul",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "ankara",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: "izmir",
          ),
        ],
        backgroundColor: Colors.orangeAccent,
        selectedItemColor:Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
      ),

    );
  }
}



class NavigationDrawer extends StatelessWidget {

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseAuth=FirebaseAuth.instance;
    var userMail = firebaseAuth.currentUser!.email.toString();
    var userId = firebaseAuth.currentUser!.uid.toString();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  //   backgroundImage :  buraya fotoğraf gelecek
                ),
                SizedBox(height: 10),

              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(userMail),
            onTap: () {
            // sayfa geçis eklenebilir
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_identity_outlined),
            title: Text(userId),
            onTap: () {
              // sayfa geçis eklenebilir
            },
          ),
          SizedBox(height: 100),
          ListTile(
            title: TextButton(
              onPressed: (){
                firebaseAuth.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text(
                "Çıkış Yap",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          )
        ],
      ),
    );
  }
}
