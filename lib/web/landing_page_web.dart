import 'package:flutter/material.dart';
import 'package:my_portfolio/component.dart';
import 'package:my_portfolio/others/Constansts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    var deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

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
                urlLancherButtons(Constants.LINKDIN,"assests/linkdin.svg"),
                urlLancherButtons(Constants.GITHUB,"assests/github.svg"),
                urlLancherButtons(Constants.MEDIUM,"assests/medium.svg")
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
            TabsWeb("HOME"),
            Spacer(),
            TabsWeb("Work"),
            Spacer(),
            TabsWeb("Blog"),
            Spacer(),
            TabsWeb("About"),
            Spacer(),
            TabsWeb("Contact"),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // This Is First Page
          Container(
            height: deviceHeight - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: SansBold("Hello I'am", 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SansBold("Aditya", 55),
                    SansBold("Flutter and Android  Developer", 30),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
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
                CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 145,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assests/profileround.png"),
                      radius: 140,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Second Page Start here
          Container(
            height: deviceHeight / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assests/web.jpg",
                  height: deviceHeight / 1.9,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Sans("MVVM", 18),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          // Third Page Start here
          Container(
            height: deviceHeight / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(Constants.WHAT_I_DO, 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedWeb(
                      imagePath: "assests/webL.png",
                      imageText: "Web Development",
                    ),
                    AnimatedWeb(
                      imagePath: "assests/app.png",
                      imageText: "App Development",
                      fitX: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedWeb(
                      imagePath: "assests/firebase.png",
                      imageText: "Firebase",
                    ),
                  ],
                )
              ],
            ),
          ),

          //Fourth Page Start Here
          Container(
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact Me", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          heading: "First Name",
                          width: 350,
                          hintText: "Please enter your first name",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                          heading: "Email",
                          width: 350,
                          hintText: "Please enter your Email Address",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          heading: "Last Name",
                          width: 350,
                          hintText: "Please enter your first name",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                          heading: "Phone Number",
                          width: 350,
                          hintText: "Please enter your Email Address",
                        )
                      ],
                    ),
                  ],
                ),
                TextForm(
                  heading: "Message",
                  width: deviceWidth / 1.5,
                  hintText: "Please enter your message",
                  maxLines: 10,
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
    );
  }

  urlLancherButtons(String url,String imagePath) {
    return IconButton(
      icon: SvgPicture.asset(imagePath),
      onPressed: () async {
        await _launchUrl(url); // Add 'await' here
      },
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
