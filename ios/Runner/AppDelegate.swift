import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      ToastMessageSetup.setUp(binaryMessenger: controller.binaryMessenger, api: MyToastMessage())
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private class MyToastMessage : ToastMessage{
        func toastMessageApi(message: String) {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.rootViewController?.showToastMessage(message: "message rat dai asfbausdfaegfalegasd a;foaiewfaweio;afsehfao;sdfhasdh;")
            }
        }
    }
}

extension UIViewController{
    func showToastMessage(message:String){
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
        toastLabel.clipsToBounds = true
        toastLabel.layer.cornerRadius = 15
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        let maxSize = CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude)
        let messageSize = toastLabel.sizeThatFits(maxSize)
        toastLabel.frame = CGRect(
            x: (UIScreen.main.bounds.width - messageSize.width)/2,
            y: self.view.frame.height - 150,
            width: messageSize.width+20,
            height: messageSize.height+15)
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
