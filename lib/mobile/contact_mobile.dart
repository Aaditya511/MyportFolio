import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../component.dart';
import '../others/Constansts.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
              background: Image.asset('assests/contact_image.jpg',
              fit: BoxFit.cover,),
            ),
          )
          ];
        }, body: SingleChildScrollView(
        padding:EdgeInsets.symmetric(vertical: 25.0) ,
        child: Wrap(
          runSpacing:20.0 ,
          spacing: 20.0,
          alignment: WrapAlignment.center,
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
                  width:  deviceWidth/ 1.5,
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

