import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 72,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assests/profile.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SansBold("Aditya", 18),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLancherButtons(Constants.LINKDIN, "assests/linkdin.svg"),
                urlLancherButtons(Constants.GITHUB, "assests/github.svg"),
                urlLancherButtons(Constants.MEDIUM, "assests/medium.svg")
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          size: 24,
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(
              flex: 3,
            ),
            TabsWeb(
              title: "Home",
              routes: Constants.homeRoutes,
            ),
            Spacer(),
            TabsWeb(
              title: "Works",
              routes: Constants.worksRoutes,
            ),
            Spacer(),
            TabsWeb(
              title: "Blog",
              routes: Constants.blogRoutes,
            ),
            Spacer(),
            TabsWeb(
              title: "About",
              routes: Constants.aboutRoutes,
            ),
            Spacer(),
            TabsWeb(
              title: "Contact",
              routes: Constants.contactRoutes,
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SansBold("About Me", 40),
                  SizedBox(
                    height: 15,
                  ),
                  Sans(Constants.My_Intro, 18),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
                CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 102,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assests/profileround.png"),
                      radius: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedWeb(
                    imagePath: "assests/webL.png",
                    width: 300,
                    height: 250,
                  ),
                  Column(
                    children: [
                      SansBold("Web Development", 18),
                      SizedBox(height: 20,),
                      Sans(Constants.webDevDetails, 12),
                    ],
                  )

                ],
              )
            ],
          ),
          SizedBox(height: 40,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SansBold("App Development", 18),
                      SizedBox(height: 20,),
                      Sans(Constants.appDevDetails, 12),
                    ],
                  ),
                  AnimatedWeb(
                    imagePath: "assests/app.png",
                    width: 300,
                    height: 250,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 40,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedWeb(
                    imagePath: "assests/firebase.png",
                    width: 300,
                    height: 250,
                  ),
                  Column(
                    children: [
                      SansBold("Firebase", 18),
                      SizedBox(height: 20,),
                      Sans(Constants.fireBaseDevDetails, 12),
                    ],
                  )

                ],
              )
            ],
          ),
          SizedBox(height: 40,),

        ],
      ),
    );
  }

  urlLancherButtons(String url, String imagePath) {
    return IconButton(
      icon: SvgPicture.asset(imagePath),
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
