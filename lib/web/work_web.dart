import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class WorksWebPage extends StatefulWidget {
  const WorksWebPage({super.key});

  @override
  State<WorksWebPage> createState() => _WorksWebPageState();
}

class _WorksWebPageState extends State<WorksWebPage> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

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
      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverAppBar(
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
              expandedHeight: 500,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 25,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assests/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(child: SansBold("Works", 40)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedWeb(
                  imagePath: "assests/myss.png",
                  width: 300,
                  height: 200,
                ),
                SizedBox(
                  width: 90,
                ),
                Flexible(
                  child: Column(
                    children: [
                      SansBold("Portfolio", 18),
                      SizedBox(
                        height: 20,
                      ),
                      Sans(Constants.portfolioDetails, 12),
                    ],
                  ),
                )
              ],
            )
          ],
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
