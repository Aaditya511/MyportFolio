import 'package:flutter/material.dart';
import '../others/component.dart';
import '../others/Constansts.dart';

class WorksWebPage extends StatefulWidget {
  const WorksWebPage({super.key});

  @override
  State<WorksWebPage> createState() => _WorksWebPageState();
}

class _WorksWebPageState extends State<WorksWebPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:
      DrawerWeb(),
      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverAppBar(
              title:
              TabsWebList(),
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
}
