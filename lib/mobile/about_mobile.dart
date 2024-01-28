import 'package:flutter/material.dart';
import '../others/component.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            size: 35.0,
            color: Colors.black,
          ),
        ),
        endDrawer: DrawerMobile(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedWeb(
                    imagePath: "assests/webL.png",
                    width: deviceWidth / 2,
                    height: 150,
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                  SizedBox(
                    height: 15,
                  ),
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
                  SizedBox(
                    height: 15,
                  ),
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
      ),
    );
  }
}
