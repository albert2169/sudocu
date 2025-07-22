import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sudocu/presentation/sudocu_app.dart';
import 'package:flutter/services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    const MethodChannel channel = MethodChannel('com.example.sudocu/device_info');
    final version = await _getAndroidSdkInt();

    if (version >= 33 && await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {},
  );

  runApp(MaterialApp(home: SudocuApp()));
}

Future<int> _getAndroidSdkInt() async {
  const MethodChannel channel = MethodChannel('com.example.sudocu/device_info');
  try {
    final int sdkInt = await channel.invokeMethod('getSdkInt');
    return sdkInt;
  } catch (e) {
    return 0;
  }
}
