import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/Screens/Home/view/home_page.dart';
import 'Provider/recipe_Provider.dart';

void main() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
