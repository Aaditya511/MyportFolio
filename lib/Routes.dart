import 'package:flutter/material.dart';
import 'package:my_portfolio/mobile/about_mobile.dart';
import 'package:my_portfolio/mobile/blog_mobile.dart';
import 'package:my_portfolio/mobile/contact_mobile.dart';
import 'package:my_portfolio/mobile/works_mobile.dart';
import 'package:my_portfolio/others/Constansts.dart';
import 'package:my_portfolio/web/about_web.dart';
import 'package:my_portfolio/web/blog_web.dart';
import 'package:my_portfolio/web/contact_web.dart';
import 'package:my_portfolio/web/landing_page_web.dart';
import 'package:my_portfolio/web/work_web.dart';

import 'mobile/landing_page_mobile.dart';

class Routes{
  static Route<dynamic> generateRout(RouteSettings settings){
    switch(settings.name){
      case Constants.homeRoutes:
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
        if (constraints.maxWidth > 800) {
          return LandingPageWeb();
        } else {
          return LandingPageMobile();
        }
      }),);
      case Constants.contactRoutes:
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
          if (constraints.maxWidth > 800) {
            return ContactWeb();
          } else {
            return ContactMobile();
          }
        }),);
      case Constants.aboutRoutes:
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
          if (constraints.maxWidth > 800) {
            return AboutWeb();
          } else {
            return AboutMobile();
          }
        }),);

      case Constants.blogRoutes:
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
          if (constraints.maxWidth > 800) {
            return BlogWeb();
          } else {
            return BlogMobile();
          }
        }),);

      case Constants.worksRoutes:
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
          if (constraints.maxWidth > 800) {
            return WorksWebPage();
          } else {
            return WorksMobile();
          }
        }),);

      default :
        return MaterialPageRoute(settings:settings,builder: (_) =>LayoutBuilder(builder: (context,constraints){
          if (constraints.maxWidth > 800) {
            return LandingPageWeb();
          } else {
            return LandingPageMobile();
          }
        }),);


    }


  }
}
