import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';
import '../others/Constansts.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              TabsMobileApp(text: "Home", route: Constants.homeRoutes),
              SizedBox(
                height: 20.0,
              ),
              TabsMobileApp(text: "Work", route: Constants.worksRoutes),
              SizedBox(
                height: 20.0,
              ),
              TabsMobileApp(text: "Blog", route: Constants.blogRoutes),
              SizedBox(
                height: 20.0,
              ),
              TabsMobileApp(text: "About", route: Constants.aboutRoutes),
              SizedBox(
                height: 20.0,
              ),
              TabsMobileApp(text: "Contact", route: Constants.contactRoutes),
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
            headerSliverBuilder: (BuildContext contxt, bool innerBoxScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 500,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(size: 35, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: AbleCustom(
                        text: Constants.welcomeBlog,
                        size: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    background: Image.asset(
                      'assests/blog.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: ListView(
              children: [
                BlogPost(),

              ],
            )),
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
class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 70,
        right: 70,
        top: 40,
      ),
      child: Container(
        padding:EdgeInsets.all(20) ,
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width:1,
            color: Colors.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: AbleCustom(
                    text: Constants.dummyBlogWhoIsDash,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7,),
            Text(Constants.dummyBlog,
              style: GoogleFonts.openSans(fontSize: 15),
              maxLines: expand==true?null:3,
              overflow: expand== true?TextOverflow.visible:TextOverflow.ellipsis ,)
          ],
        ),
      ),
    );
  }
}
