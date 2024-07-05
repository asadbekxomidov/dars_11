import 'package:firebase_messaging/firebase_messaging.dart';

class FirebasePushNotifiation {
  static final _pushNotification = FirebaseMessaging.instance;

  static Future<void> init() async {
    final notificationSettings = await _pushNotification.requestPermission();

    final token = await _pushNotification.getToken();
    print(token);
    // backgrounda xabar kelsa ishlaydi
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Xabar orqali dasturga kirilganda xabar keldi');
      print('Xabar $message');
    });

    // foregroundda xabar kelsa ishlaydi
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Dsturda bolganda xabar keldi');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
