import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_list/view_model/user_view_model.dart';
import 'user_list/view/user_list_page.dart';
// import 'package:untitled2/user_list/view/user_list_page.dart';
// import 'package:untitled2/user_list/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: MaterialApp(
        title: 'User List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}