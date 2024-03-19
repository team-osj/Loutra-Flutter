import UIKit
import Flutter
import Firebase

@available(iOS 13.0.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var channel: FlutterMethodChannel?
    private var nfcData = -1
    private var isAppRunning = false
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        let controller = self.window.rootViewController as! FlutterViewController
        channel = FlutterMethodChannel.init(name: "com.osj.lotura/nfc_info", binaryMessenger: controller as! FlutterBinaryMessenger)
        channel?.setMethodCallHandler { (call, result) in
            if(call.method == "getNFCInfo") {
                result("{\"index\" : \(self.nfcData)}")
            }
        }
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        let contents = url.absoluteString.components(separatedBy: "=")
        self.nfcData = NSString(string : contents[1]).integerValue
        return true
    }
    
    override func applicationWillEnterForeground(_ application: UIApplication) {
        if self.isAppRunning == true {
            self.nfcData = -1
        } else {
            self.isAppRunning = true
        }
    }
    
    override func applicationWillResignActive(_ application: UIApplication) {
        if self.isAppRunning == true {
            self.nfcData = -1
        } else {
            self.isAppRunning = true
        }
    }
}
