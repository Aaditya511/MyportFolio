import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Image.asset("assests/profileround.png"),
              ),
            ),
            TabsMobileApp(text: "Home", route: '/'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Work", route: '/work'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Blog", route: '/blog'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "About", route: '/about'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Contact", route: '/contact'),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLancherButtons(Constants.LINKDIN, "assests/linkdin.svg"),
                urlLancherButtons(Constants.GITHUB, "assests/github.svg"),
                urlLancherButtons(Constants.MEDIUM, "assests/medium.svg")
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 95,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 93,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 90,
                  child: Image.asset("assests/profileround.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansBold("About Me", 40),
                  SizedBox(
                    height: 15,
                  ),
                  Sans(Constants.My_Intro, 18),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.tealAccent,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7),
                        child: Sans("Flutter", 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.tealAccent,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7),
                        child: Sans("Android Native", 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.tealAccent,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7),
                        child: Sans("FireBase", 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.tealAccent,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7),
                        child: Sans("MVVM", 18),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedWeb(
                  imagePath: "assests/webL.png",
                  width: deviceWidth / 2,
                  height: 150,
                ),
                SizedBox(height: 15,),
                SansBold("Web Development", 18),
                Sans(Constants.webDevDetails, 12),
                SizedBox(
                  height: 30,
                ),
                AnimatedWeb(
                  imagePath: "assests/app.png",
                  fit: BoxFit.contain,
                  reverse: true,
                  width: deviceWidth / 2,
                  height: 150,
                ),
                SizedBox(height: 15,),
                SansBold("App Development", 18),
                Sans(Constants.appDevDetails, 12),
                SizedBox(
                  height: 30,
                ),
                AnimatedWeb(
                  imagePath: "assests/firebase.png",
                  width: deviceWidth / 2,
                  height: 150,
                ),
                SizedBox(height: 15,),
                SansBold("Firebase", 18),
                Sans(Constants.fireBaseDevDetails, 12),
                SizedBox(
                  height: 30,
                ),
              ],
            )


          ],
        ),
      ),
    ),);
  }


  urlLancherButtons(String url, String imagePath) {
    return IconButton(
      icon: SvgPicture.asset(
        imagePath,
        width: 35,
      ),
      onPressed: () async {
        await _launchUrl(url); // Add 'await' here
      },
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }}
