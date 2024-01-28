import 'package:flutter/material.dart';
import 'package:my_portfolio/others/component.dart';
import '../others/Constansts.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        endDrawer:
        DrawerMobile(),
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
                child:
              ContactMobileSection(deviceWidth: deviceWidth,),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

}

