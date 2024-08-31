import 'package:flutter/material.dart';
import 'package:online_shop/Controller/page_index_controller.dart';
import 'package:online_shop/View/Screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PageIndexController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
