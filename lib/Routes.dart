
import 'package:flutter/material.dart';
import 'package:my_portfolio/mobile/contact_mobile.dart';
import 'package:my_portfolio/others/Constansts.dart';
import 'package:my_portfolio/web/contact_web.dart';
import 'package:my_portfolio/web/landing_page_web.dart';

import 'mobile/landing_page_mobile.dart';

class Routes{
  static Route<dynamic> generateRout(RouteSettings settings){
    switch(settings.name){
      case '/':
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
