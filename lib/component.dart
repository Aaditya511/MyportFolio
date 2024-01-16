import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsMobileApp extends StatefulWidget {
  final text;
  final route;
  const TabsMobileApp({super.key,@required this.text, @required this.route});

  @override
  State<TabsMobileApp> createState() => _TabsMobileAppState();
}

class _TabsMobileAppState extends State<TabsMobileApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){},
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0 ,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(widget.text,
      style: GoogleFonts.openSans(
        fontSize: 20.0,
        color: Colors.white
      ),),
    );
  }
}




class TabsWeb extends StatefulWidget {
  final title;
  final routes;

  const TabsWeb( {super.key, this.title, this.routes});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
  const SansBold(this.text,this.size,{super.key});

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
  const Sans(this.text,this.size,{super.key});

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
  const TextForm({super.key, @required this.heading,@required this.width, @required this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(heading, 16.0,),
        SizedBox(height: 5,),
        Column(
          children: [
            SizedBox(
              child: TextFormField(
                maxLines: maxLines == null?null:maxLines,
                decoration: InputDecoration(
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
    )
    ;
  }
}

class AnimatedWeb extends StatefulWidget {
  final imagePath;
  final imageText;
  final fit;
  final reverse;
  final width ;
  final height;
  const AnimatedWeb({super.key,@required this.imagePath, @required this.imageText, this.fit, this.reverse, this.width, this.height});

  @override
  State<AnimatedWeb> createState() => _AnimatedWebState();
}

class _AnimatedWebState extends State<AnimatedWeb> with SingleTickerProviderStateMixin {
  late AnimationController _controller  = AnimationController(vsync: this,
  duration: Duration(seconds: 4),)..repeat(reverse: true);

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
    return SlideTransition(position: _animation,
    child:
    Card(
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
            height: widget.height == null?200:widget.height,
            width: widget.width == null?200:widget.width,
            fit:widget.fit == null?null:widget.fit,
          ),
          SizedBox(
            height: 10,
          ),
          SansBold(widget.imageText, 18),

        ],
      ),
    ),

    );
  }
}




