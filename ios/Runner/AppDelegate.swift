import UIKit
import Flutter
import Reachability

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.mottu.marvel/connectivity"
  var reachability: Reachability?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    if let controller = window?.rootViewController as? FlutterViewController {
      let connectivityChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

      connectivityChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "startConnectivityListener" {
          self.startConnectivityListener()
          result(nil)
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func startConnectivityListener() {
    reachability = try? Reachability()

    reachability?.whenReachable = { reachability in
      if reachability.connection == .wifi || reachability.connection == .cellular {
        self.sendConnectivityMessage(status: "online")
      }
    }

    reachability?.whenUnreachable = { _ in
      self.sendConnectivityMessage(status: "offline")
    }

    do {
      try reachability?.startNotifier()
    } catch {
      print("Unable to start notifier")
    }
  }

  private func sendConnectivityMessage(status: String) {
    if let controller = window?.rootViewController as? FlutterViewController {
      let connectivityChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
      connectivityChannel.invokeMethod("updateConnectivityStatus", arguments: status)
    }
  }
}
