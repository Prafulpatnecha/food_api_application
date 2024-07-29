import 'package:flutter/material.dart';

import '../view/detail/detail_page.dart';
import '../view/home/home_page.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/detail':(context)=>const DetailPage()
  };
}