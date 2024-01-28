import 'package:flutter/material.dart';
import '../others/component.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {


  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        endDrawer:
        DrawerMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext contxt, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assests/contact_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child:
          ContactMobileSection(deviceWidth: deviceWidth,),
          ),
        ),
      ),
    );
  }

}
