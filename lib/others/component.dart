import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constansts.dart';

class TabsMobileApp extends StatefulWidget {
  final text;
  final route;

  const TabsMobileApp({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobileApp> createState() => _TabsMobileAppState();
}

class _TabsMobileAppState extends State<TabsMobileApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}

class TabsWeb extends StatefulWidget {
  final title;
  final routes;

  const TabsWeb({super.key, this.title, this.routes});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.routes);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceInOut,
          style: isSelected
              ? GoogleFonts.oswald(
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              decorationColor: Colors.tealAccent)
              : GoogleFonts.oswald(
            color: Colors.black,
            fontSize: 24.0,
          ),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm({super.key,
    @required this.heading,
    @required this.width,
    @required this.hintText,
    this.maxLines,
    @required this.controller,
    @required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(
          heading,
          16.0,
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            SizedBox(
              child: TextFormField(
                controller: controller,
                validator: validator,
                maxLines: maxLines == null ? null : maxLines,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              width: width,
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedWeb extends StatefulWidget {
  final imagePath;
  final imageText;
  final fit;
  final reverse;
  final width;

  final height;

  const AnimatedWeb({super.key,
    @required this.imagePath,
    this.imageText,
    this.fit,
    this.reverse,
    this.width,
    this.height});

  @override
  State<AnimatedWeb> createState() => _AnimatedWebState();
}

class _AnimatedWebState extends State<AnimatedWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  )
    ..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        color: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.tealAccent),
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: Colors.tealAccent,
        child: Column(
          children: [
            Image.asset(
              widget.imagePath,
              height: widget.height == null ? 200 : widget.height,
              width: widget.width == null ? 200 : widget.width,
              fit: widget.fit == null ? null : widget.fit,
            ),
            SizedBox(
              height: 10,
            ),
            widget.imageText == null
                ? SizedBox()
                : SansBold(widget.imageText, 18),
          ],
        ),
      ),
    );
  }
}

class AbleCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbleCustom({super.key,
    @required this.text,
    @required this.size,
    this.color,
    this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
          fontSize: size,
          color: color == null ? Colors.black : color,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}

class AddDataFireStore {
  var logger = Logger();
  CollectionReference response =
  FirebaseFirestore.instance.collection("Messages");

  Future<DocumentReference> addResponse(final firstName, final lastName,
      final email,
      final phone, final message) async {
    return response
        .add({
      "First Name": firstName,
      "Last Name": lastName,
      "Email": email,
      "Phone Number": phone,
      "Message": message,
    });
  }
}

Future DailogError(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: SansBold(title, 20),
          ));
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: Constants.home,
          routes: Constants.homeRoutes,
        ),
        Spacer(),
        TabsWeb(
          title: Constants.works,
          routes: Constants.worksRoutes,
        ),
        Spacer(),
        TabsWeb(
          title: Constants.blogs,
          routes: Constants.blogRoutes,
        ),
        Spacer(),
        TabsWeb(
          title: Constants.about,
          routes: Constants.aboutRoutes,
        ),
        Spacer(),
        TabsWeb(
          title: Constants.contact,
          routes: Constants.contactRoutes,
        ),
        SizedBox(
          width: 30,
        )
      ],
    );
  }
}

class DrawerWeb extends StatelessWidget {
  const DrawerWeb({super.key});

  @override
  Widget build(BuildContext context) {

    return  Drawer(
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
    );
  }
}

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          TabsMobileApp(text: Constants.home, route: Constants.homeRoutes),
          SizedBox(
            height: 20.0,
          ),
          TabsMobileApp(text: Constants.works, route: Constants.worksRoutes),
          SizedBox(
            height: 20.0,
          ),
          TabsMobileApp(text: Constants.blogs, route: Constants.blogRoutes),
          SizedBox(
            height: 20.0,
          ),
          TabsMobileApp(text: Constants.about, route: Constants.aboutRoutes),
          SizedBox(
            height: 20.0,
          ),
          TabsMobileApp(text: Constants.contact, route: Constants.contactRoutes),
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
    );
  }
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


class ContactWebSection extends StatefulWidget {
  final deviceWidth;
  const ContactWebSection({super.key, this.deviceWidth});

  @override
  State<ContactWebSection> createState() => _ContactWebSectionState();
}

class _ContactWebSectionState extends State<ContactWebSection> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ),
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
                    controller: firstNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Error";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                    heading: Constants.email,
                    width: 350,
                    controller: emailController,
                    hintText: Constants.emailHint,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Error";
                      }
                    },
                  )
                ],
              ),
              Column(
                children: [
                  TextForm(
                    controller: lastNameController,
                    heading: Constants.lastName,
                    width: 350,
                    hintText: Constants.lastNameHint,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Error";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                    controller: phoneNumberController,
                    heading: Constants.phoneNum,
                    width: 350,
                    hintText: Constants.phoneNumHint,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Error";
                      }
                    },
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextForm(
            controller: messageController,
            heading: Constants.message,
            width:  widget.deviceWidth/1.5,
            hintText: Constants.messageHint,
            maxLines: 10,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Error";
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () async {
              final addData = AddDataFireStore();
              if (formKey.currentState!.validate()) {
                await addData
                    .addResponse(
                    firstNameController.text,
                    lastNameController.text,
                    emailController.text,
                    phoneNumberController.text,
                    messageController.text)
                    .then(
                        (value) => DailogError(context, "Data Submitted"))
                    .catchError((error) =>
                    DailogError(context, "Something went  Wrong"))
                    .whenComplete(() => formKey.currentState!.reset());
              }
            },
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 200,
            color: Colors.tealAccent,
            child: SansBold("Submit", 20.0),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


class ContactMobileSection extends StatefulWidget {
  final deviceWidth;
  const ContactMobileSection({super.key, this.deviceWidth});

  @override
  State<ContactMobileSection> createState() => _ContactMobileSectionState();
}

class _ContactMobileSectionState extends State<ContactMobileSection> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold("Contact Me", 40),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextForm(
              heading: Constants.firstName,
              width: widget.deviceWidth / 1.5,
              hintText: Constants.nameHint,
              controller: firstNameController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Error";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextForm(
              heading: Constants.lastName,
              width: widget.deviceWidth / 1.5,
              hintText: Constants.lastNameHint,
              controller: lastNameController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Error";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextForm(
              controller: phoneNumberController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Error";
                }
              },
              heading: Constants.phoneNum,
              width: widget.deviceWidth / 1.5,
              hintText: Constants.phoneNumHint,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextForm(
              heading: Constants.email,
              width: widget.deviceWidth / 1.5,
              hintText: Constants.emailHint,
              controller: emailController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Error";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextForm(
              heading: "Message",
              width: widget.deviceWidth / 1.5,
              hintText: "Please enter your message",
              maxLines: 10,
              controller: messageController,
              validator: (text) {
                if (text.toString().isEmpty) {
                  return "Error";
                }
              },
            ),
          ),
          MaterialButton(
            onPressed: ()
            async {
              final addData = AddDataFireStore();
              if (formKey.currentState!.validate()) {
                await addData
                    .addResponse(
                    firstNameController.text,
                    lastNameController.text,
                    emailController.text,
                    phoneNumberController.text,
                    messageController.text)
                    .then(
                        (value) => DailogError(context, "Data Submitted"))
                    .catchError((error) =>
                    DailogError(context, "Something went  Wrong"))
                    .whenComplete(() => formKey.currentState!.reset());
              }
            },
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
    );
  }
}


