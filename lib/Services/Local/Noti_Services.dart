import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_list/Services/Local/DBHelper.dart';

@pragma('vm:entry-point')
void onBackgroundAction(NotificationResponse response) {
  _handleAction(response.actionId, response.id);
}

// Top level handler — called by both foreground and background
void _handleAction(String? actionId, int? notificationId) async {
  if (actionId == null || notificationId == null) return;

  if (actionId.startsWith('done_')) {
    final taskId = int.parse(actionId.split('_')[1]);
    await _markTaskDoneFromNotification(taskId);
    NotiServices.onTaskDoneStream.add(taskId);
  }
}

Future<void> _markTaskDoneFromNotification(int taskId) async {
  print('✅ _markTaskDoneFromNotification called — taskId: $taskId');
  // Mark complete in DB
  DBHelper DBinstens = DBHelper.DBInstance;
  final DB = DBinstens.getDB();
  DBinstens.UpdateTask(await DB, taskId, 1);

  // Cancel notification — task is done, no need to remind
  await NotiServices().cancelNotification(taskId);
}

class NotiServices {
  NotiServices._();

  static final Noti_Instance = NotiServices._();

  factory NotiServices() => Noti_Instance;

  final _Plugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get initalize => _isInitialized;

  static final StreamController<int> onTaskDoneStream =
      StreamController<int>.broadcast();

  ///Initializ

  Future<void> initNotification() async {
    if (_isInitialized) return; // prevent re- initialize
    const initSettingAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    /*const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );*/
    const initSetting = InitializationSettings(android: initSettingAndroid);

    await _Plugin.initialize(
      settings: initSetting,
      // App open or in background
      onDidReceiveNotificationResponse: (response) {
        _handleAction(response.actionId, response.id);
      },

      // App completely killed
      onDidReceiveBackgroundNotificationResponse: onBackgroundAction,
    );

    await requestPermission();
  }

  Future<bool> requestPermission() async {
    // Android 13+ requires explicit permission request
    final android =
        _Plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    // Request notification permission (Android 13+)
    await android?.requestNotificationsPermission();

    // Request exact alarm permission (Android 12+)
    await android?.requestExactAlarmsPermission();
    return true;
  }

  ///notification Detail setup
  NotificationDetails noti_Detail(int id) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'task_Channel',
        'Tasks_notification',
        channelDescription: 'Reminder for your Task ',
        importance: Importance.max,
        priority: Priority.high,
        actions: [
          AndroidNotificationAction(
            'done_$id',
            'Done',
            cancelNotification: true,
            showsUserInterface: false,
          ),
          AndroidNotificationAction(
            'reschedule_$id',
            'Reschedule', // implementation is pending.....
            cancelNotification: false,
            showsUserInterface: true,
          ),
        ],
      ),
    );
  }

  ///Show notification
  Future<void> ShowNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return _Plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: noti_Detail(id),
    );
  }

  /// Schedule Notification
  Future<void> Schedule_Notification({
    required int id,
    String? title,
    String? Detail,
    required DateTime? ScheduledDate,
  }) async {
    _Plugin.zonedSchedule(
      id: id,
      title: title,
      body: Detail,
      scheduledDate: tz.TZDateTime.from(ScheduledDate!, tz.local),
      notificationDetails: noti_Detail(id),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelNotification(int taskId) async {
    _Plugin.cancel(id: taskId);
  }

  /// extra methods to combine time and Date
}
