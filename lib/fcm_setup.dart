
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notif_demo/routes.dart';

class FirebasePushManager {
  FirebasePushManager._();

  // A singleton
  static final _instance = FirebasePushManager._();
  factory FirebasePushManager() => _instance;

  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // This appears only in iOS but it's really important.
      // Update the iOS foreground notification presentation options to allow
      // heads up notifications.
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen((event) {
        _showAlert(event.data);
      });

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      _initialized = true;
    }
  }

  Future<void> _showAlert(Map<String, dynamic> data) async {
    final author = data['author'] as String;

    // Actually you should use 'showDialog' or 'showCupertinoDialog'
    // to nicely display a message to the user
    debugPrint('Notification sent by $author');
  }

  Future<void> _navigateToRoute(Map<String, dynamic> data) async {
    // When sending a notification, you add as payload the name of
    // the route to which you want to navigate.
    final routeName = data['route'] as String;

    RouteGenerator.key.currentState?.pushNamed(routeName);
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    _navigateToRoute(message.data);
  }

}