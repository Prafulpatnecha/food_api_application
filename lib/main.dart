import 'package:flutter/material.dart';
import 'package:food_api_application/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'controller/controlling.dart';

void main()
{
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => HomeProvider(),),],builder: (context, child) => const MyApp(),),);
}