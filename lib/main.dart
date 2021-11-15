// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void _launchURL(url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.bio.link/uploads/profile_pictures/2021-06-25/qwcoa88nBwyt2QazUFCRuY95AuW6F2E.webp"),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Austin Archer",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Content Creator, Actor, Musician",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Socialcons(
                      icon: "assets/fb.png",
                      link: "https://www.facebook.com/",
                    ),
                    Socialcons(
                      icon: "assets/twitter.jpg",
                      link: "https://twitter.com/",
                    ),
                    Socialcons(
                      icon: "assets/insta.png",
                      link: "https://www.instagram.com/don_k_jacob",
                    ),
                    Socialcons(
                      icon: "assets/github.png",
                      link: "https://github.com/",
                    ),
                    Socialcons(
                      icon: "assets/linkedin.png",
                      link: "https://www.linkedin.com/",
                    ),
                    Socialcons(
                      icon: "assets/whatsapp.png",
                      link: "https://web.whatsapp.com/",
                    ),
                  ],
                ),
                Card(),
                Card(),
                Card(),
                Card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 30, right: 50),
      height: 50,
      width: 380,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                offset: Offset(5, 5),
                color: Colors.grey.shade300)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.ac_unit),
          Text(
            "Welcome to my page",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class Socialcons extends StatelessWidget {
  Socialcons({
    required this.icon,
    required this.link,
    Key? key,
  }) : super(key: key);

  void _launchURL(url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  String icon;
  String link;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => _launchURL(link),
        child: Image.asset(
          icon,
          height: 35,
        ),
      ),
    );
  }
}
