import 'package:flutter/material.dart';
import 'package:flutter_push_notif_demo/routes.dart';
import 'package:flutter_push_notif_demo/widgets/init_firebase_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: RouteGenerator.key,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Push Notification')
      ),
      body: Center(
        child: const InitFirebaseWidget(),
      ),
    );
  }
}

