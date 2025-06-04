import 'package:denta_soft/utils/SharedPrafrance/SharedPrafranceKeys.dart';
import 'package:denta_soft/utils/SharedPrafrance/SharedPrafranceManager.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  pushCustomNotification(message);

  print("Handling a background message: ${message.messageId}");
}

pushCustomNotification(RemoteMessage message) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: int.parse(message.data['id']),
      channelKey: 'PentaCors_Notification',
      title: message.data['title'],
      body: message.data['body'],
      bigPicture: message.data['image'] != null
          ? 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png'
          : "",
      notificationLayout: message.data['image'] != null
          ? NotificationLayout.BigPicture
          : NotificationLayout.BigText,
    ),
  );
}

class FCM {
  startFCM() async {
    try {
      //Init firebase
      await Firebase.initializeApp();

      FirebaseMessaging messaging = FirebaseMessaging.instance;

      // Update token when user login
      FirebaseMessaging.instance.onTokenRefresh.listen((String token) async {
        if (await SharedPrafranceManager().isContainsKey(
          SecureStorageKeys.accountData,
        )) {
          // NotificationController().updateFCMToken(token);
        }
      });

      // ignore: unused_local_variable
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      AwesomeNotifications().initialize(null, [
        NotificationChannel(
          channelKey: 'PentaCors_Notification',
          channelName: 'PentaCors Notification',
          channelDescription:
              'PentaCors channel get you all news/notification in PentaCors App',
          defaultColor: Colors.blue,
          channelShowBadge: true,
          ledColor: Colors.white,
        ),
      ]);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        pushCustomNotification(message);
      });

      //    AwesomeNotifications().actionStream.listen((receivedNotification) {
      // print(receivedNotification.toMap().toString());
      // switch (receivedNotification.payload) {
      //   case "0":
      //     Future.delayed(Duration(seconds: 1), () {
      //       AwesomeNotifications().cancel(receivedNotification.id!);
      //     });
      //     break;
      //   case "1":
      //     break;
      //   default:
      //     GoTo.screen(
      //         GlobalData.globalContext!,
      //         ProductScreen(
      //           productID: 1,
      //           serviceID: 1,
      //         ));
      //     break;
      // }
      // print("kkkkkkkkkk:: " +
      //     receivedNotification.buttonKeyInput +
      //     " - " +
      //     receivedNotification.id.toString());
      //  });

      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      await FirebaseMessaging.instance.subscribeToTopic('All');
    } catch (e) {}
  }
}
