import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/component.dart';
import 'package:url_launcher/url_launcher.dart';

import '../others/Constansts.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
            TabsMobileApp(text: "Home", route: Constants.homeRoutes),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Work", route: Constants.worksRoutes),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Blog", route: Constants.blogRoutes),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "About", route: Constants.aboutRoutes),
            SizedBox(
              height: 20.0,
            ),
            TabsMobileApp(text: "Contact", route: Constants.contactRoutes),
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                      radius: 95,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 93,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assests/profileround.png"),
                          radius: 90,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SansBold("Hello I'am", 18),
                ),
                SansBold(Constants.name, 45),
                Sans(Constants.job, 25),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    Sans("aditya9310adi@gmail.com", 18)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: 10,
                    ),
                    Sans("+91 9953600342", 18)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 10,
                    ),
                    Sans("New Delhi", 18)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            // about me section
            Column(
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
            SizedBox(
              height: 40,
            ),
            // what i do section
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold(Constants.WHAT_I_DO, 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedWeb(
                        imagePath: "assests/webL.png",
                        imageText: "Web Development",
                        width: deviceWidth / 2,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AnimatedWeb(
                        imagePath: "assests/app.png",
                        imageText: "App Development",
                        fit: BoxFit.contain,
                        reverse: true,
                        width: deviceWidth / 2,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AnimatedWeb(
                        imagePath: "assests/firebase.png",
                        imageText: "Firebase",
                        width: deviceWidth / 2,
                        height: 150,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Contact me section
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold("Contact Me", 40),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextForm(
                      heading: Constants.firstName,
                      width: deviceWidth / 1.5,
                      hintText: Constants.nameHint,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextForm(
                      heading: Constants.lastName,
                      width: deviceWidth / 1.5,
                      hintText: Constants.lastNameHint,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextForm(
                      heading: Constants.phoneNum,
                      width: deviceWidth / 1.5,
                      hintText: Constants.phoneNumHint,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextForm(
                      heading: Constants.email,
                      width: deviceWidth / 1.5,
                      hintText: Constants.emailHint,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextForm(
                      heading: "Message",
                      width: deviceWidth / 1.5,
                      hintText: "Please enter your message",
                      maxLines: 10,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: 200,
                    color: Colors.tealAccent,
                    child: SansBold("Submit", 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
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
  }

}

