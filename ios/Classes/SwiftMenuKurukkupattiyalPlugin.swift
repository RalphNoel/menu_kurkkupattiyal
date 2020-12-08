import Flutter
import UIKit

public class SwiftMenuKurukkupattiyalPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "menu_kurukkupattiyal", binaryMessenger: registrar.messenger())
    let instance = SwiftMenuKurukkupattiyalPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
