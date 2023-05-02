import 'package:flutter/material.dart';
import 'pages/profile.dart';
import 'pages/weather1.dart';
import 'pages/contacts.dart';

void main()=>runApp(  MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context)=> const Home(),
    '/profile': (context)=> const Profile(),
    '/weather1': (context)=> const Weather1(),
    '/contacts': (context)=> const Contacts(),
  },
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('My App',
          style: TextStyle(
              fontSize: 25.0
          ),
        ),
        centerTitle: true,
        titleSpacing: 2.0,
        backgroundColor: Colors.indigo[700],
        toolbarHeight: 55.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
              margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 105.0),
              padding: const EdgeInsets.symmetric(vertical: 30.0 , horizontal: 20.0),
              child: const Text('Profile',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/weather1');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
              margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 105.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0 , horizontal: 9.0),
              child: const Text('Weather',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/contacts');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
              margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 105.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0 , horizontal: 8.0),
              child: const Text('Contacts',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

