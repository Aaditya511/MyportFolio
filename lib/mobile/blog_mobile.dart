import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/others/Constansts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

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
                  expandedHeight: 400,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(size: 35, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: AbleCustom(
                        text: Constants.welcomeBlog,
                        size: 24,
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
            body:
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Aricles")
                    .snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                          return BlogPost(title: documentSnapshot["title"], body: documentSnapshot["body"]);
                        });
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            )

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

class BlogPost extends StatefulWidget {
  final title;
  final body;
  const BlogPost({super.key, @required this.title,@required this.body});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: Container(
        padding:EdgeInsets.all(10) ,
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
                    text: widget.title.toString(),
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
            Text(widget.body.toString(),
              style: GoogleFonts.openSans(fontSize: 15),
              maxLines: expand==true?null:3,
              overflow: expand== true?TextOverflow.visible:TextOverflow.ellipsis ,)
          ],
        ),
      ),
    );
  }
}
