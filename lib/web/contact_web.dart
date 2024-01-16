import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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
      body: NestedScrollView(
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
                  "assests/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20,),
              SansBold("Contact Me", 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                        heading: Constants.firstName,
                        width: 350,
                        hintText: Constants.nameHint,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextForm(
                        heading: Constants.email,
                        width: 350,
                        hintText: Constants.emailHint,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextForm(
                        heading: Constants.lastName,
                        width: 350,
                        hintText: Constants.lastNameHint,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextForm(
                        heading: Constants.phoneNum,
                        width: 350,
                        hintText: Constants.phoneNumHint,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              TextForm(
                heading: Constants.message,
                width: deviceWidth / 1.5,
                hintText: Constants.messageHint,
                maxLines: 10,
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),

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
