import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext contxt,bool innerBoxScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                  size: 35,
                  color: Colors.black
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assests/works.jpg',
                  fit: BoxFit.cover,),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Center(child: SansBold("Works", 40)),
              SizedBox(height: 10,),
              Column(
                children: [
                  AnimatedWeb(
                    imagePath: "assests/myss.png",
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(height: 50,),

                  Column(
                    children: [
                      SansBold("Portfolio", 18),
                      SizedBox(height: 20,),
                      Sans(Constants.portfolioDetails, 12),
                    ],
                  )


                ],
              )

            ],
          ),
        ),
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
