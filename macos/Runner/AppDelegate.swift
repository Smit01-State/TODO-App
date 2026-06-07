import Cocoa
import FlutterMacOS
import UserNotifications

@main
class AppDelegate: FlutterAppDelegate, UNUserNotificationCenterDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    // Set notification delegate for foreground notification delivery
    if #available(macOS 10.14, *) {
      UNUserNotificationCenter.current().delegate = self
    }
    super.applicationDidFinishLaunching(notification)
  }
}
