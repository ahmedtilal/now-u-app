import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:app/locator.dart';
import 'package:app/services/navigation_service.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  Future init() async {
    if (Platform.isIOS) {
      NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: $message');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessage: $message');
      _serialiseAndNavigate(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessage: $message');
      _serialiseAndNavigate(message);
    });
  }

  void _serialiseAndNavigate(RemoteMessage message) {
    var notificationData = message.data;
    var view = notificationData['view'];

    if (view != null) {
      _navigationService.navigateTo(view);
    }
  }
}
