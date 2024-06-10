import 'package:assignment10/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';


Future<void>handler(RemoteMessage message) async {
  print('title : ${message.notification?.title}');
  print('body : ${message.notification?.body}');
  print('title : ${message.data}');
}

void handleMessage (RemoteMessage? message) {
  if(message == null) return ;

  navigatorKey.currentState?.context.push('/author');
}


Future initPushNotofication() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
alert: true,
badge: true,
sound: true
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handler);
}
class FirebaseApi
{


  final _firebaseMessaging = FirebaseMessaging.instance;

  // final _androidChannel = const AndroidNotificationChannel('high_importance_channel'
  // 'high_importance_notofication'
  // description: "this channel is used for important notofication",
  // importance: Importance.defaultImportance
  // );

  Future<void> initNotifications () async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    //FirebaseMessaging.onBackgroundMessage(handler);
    initPushNotofication();
  }
}