import 'package:flutterapp/services/notify_service.dart';
import 'package:flutterapp/values/app_lib.dart';

class PushNotifications extends StatefulWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  State<PushNotifications> createState() => _PushNotificationsState();
}

class _PushNotificationsState extends State<PushNotifications> {
  // Load notification services
  final LocalNotificationService _notifyService = LocalNotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalWidget().dynamicAppBar("Push Notifications"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.showNotification();
                  },
                  child: Text(
                    'Show Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.showDynamicNotification(
                        2,
                        "Amazon's Great Indian Festival Offer",
                        "Hurray!, India's best offers are available right now in Amazon");
                  },
                  child: Text(
                    'Dynamic Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.scheduledNotification(
                        3,
                        "Amazon's Great Indian Festival Offer",
                        "Hurray!, India's best offers are available right now in Amazon");
                  },
                  child: Text(
                    'Scheduled Notifications',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.cancelNotification(3);
                  },
                  child: Text(
                    'Cancel Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.cancelAllNotifications();
                  },
                  child: Text(
                    'Cancel All Notifications',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
