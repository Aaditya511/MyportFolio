import 'package:flutter/material.dart';
import '../others/component.dart';
import '../others/Constansts.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer:
      DrawerMobile(),
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
}
