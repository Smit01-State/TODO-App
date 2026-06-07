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

  // Android uses 'done_{taskId}' as actionId (e.g. 'done_42')
  // iOS/macOS uses fixed 'done_action' — the task ID is the notification ID
  if (actionId == 'done_action') {
    // iOS/macOS: notification ID is the task ID
    await _markTaskDoneFromNotification(notificationId);
    NotiServices.onTaskDoneStream.add(notificationId);
  } else if (actionId.startsWith('done_')) {
    // Android: task ID is embedded in the action ID
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

/// Notification category identifier for task reminders (iOS/macOS)
const String _taskCategoryId = 'task_reminder_category';

class NotiServices {
  NotiServices._();

  static final Noti_Instance = NotiServices._();

  factory NotiServices() => Noti_Instance;

  final _Plugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get initalize => _isInitialized;

  static final StreamController<int> onTaskDoneStream =
      StreamController<int>.broadcast();

  ///Initialize

  Future<void> initNotification() async {
    if (_isInitialized) return; // prevent re-initialize

    // Android settings
    const initSettingAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS & macOS (Darwin) settings with notification categories for action buttons
    final initSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: _buildDarwinCategories(),
    );

    final initSetting = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingsDarwin,
      macOS: initSettingsDarwin,
    );

    await _Plugin.initialize(
      settings: initSetting,
      // App open or in background
      onDidReceiveNotificationResponse: (response) {
        _handleAction(response.actionId, response.id);
      },

      // App completely killed
      onDidReceiveBackgroundNotificationResponse: onBackgroundAction,
    );

    _isInitialized = true;
    await requestPermission();
  }

  /// Build Darwin notification categories with action buttons
  /// Note: Category IDs use a fixed identifier since iOS categories are
  /// registered once at init. The actual task ID is embedded in the actionId
  /// at notification-show time via the notification payload/action handling.
  List<DarwinNotificationCategory> _buildDarwinCategories() {
    return <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        _taskCategoryId,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain(
            'done_action',
            'Done',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            'reschedule_action',
            'Reschedule',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
        ],
      ),
    ];
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

    // iOS permission request
    final iOS =
        _Plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    await iOS?.requestPermissions(alert: true, badge: true, sound: true);

    // macOS permission request
    final macOS =
        _Plugin.resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >();
    await macOS?.requestPermissions(alert: true, badge: true, sound: true);

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
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        categoryIdentifier: _taskCategoryId,
      ),
      macOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        categoryIdentifier: _taskCategoryId,
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
