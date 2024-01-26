import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../others/Constansts.dart';
import '../others/component.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    bool isWeb  = MediaQuery.of(context).size.width > 800;
    return SafeArea(
      child: Scaffold(
        endDrawer:
        DrawerMobile(),
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext contxt, bool innerBoxScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight:isWeb?500:400,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(size: 35, color: Colors.black),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: isWeb?false:true,
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: EdgeInsets.symmetric(horizontal:isWeb?7.0:4.0),
                      child: AbleCustom(
                        text: Constants.welcomeBlog,
                        size: isWeb?30.0:24.0,
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
                          return BlogPost(title: documentSnapshot["title"], body: documentSnapshot["body"],isWeb: isWeb,);
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
}


class BlogPost extends StatefulWidget {
  final title;
  final body;
  final isWeb;
  const BlogPost({super.key, @required this.title,@required this.body,@required this.isWeb});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isWeb?EdgeInsets.only(
        left: 70,
        right: 70,
        top: 40,
      ):EdgeInsets.only(
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
