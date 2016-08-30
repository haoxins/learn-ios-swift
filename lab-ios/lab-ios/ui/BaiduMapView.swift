
import CoreLocation
import Foundation
import WebKit
import UIKit

class BaiduMapView: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray

        view.addSubview(self.getBackBtn())

        self.alert("xxoo", message: "ooooooo")
    }

    func initWKCnfig() -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        return config
    }

    func initWKWebView() -> WKWebView {
        let webView = WKWebView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height),
            configuration: self.initWKCnfig()
        )

        webView.navigationDelegate = self

        let req = URLRequest(url: URL(string: "http://localhost:3000/map")!)
        print("wk: goto page")
        webView.load(req)

        return webView
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //
    }

    func getLocation() {
        //
    }

    func alert(_ title: String, message: String) {
        self.present(newAlert(title: title, message: message), animated: true, completion: nil)
    }

    func getBackBtn() -> UIButton {
        let backBtn = UIButton() { b in
            b.title = "back"
            b.radius = 5
            b.frame = CGRect(x: 10, y: 10, width: 40, height: 30)

            b.addTarget(self, action: #selector(BaiduMapView.gotoMain), for: .touchUpInside)
        }

        return backBtn
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "baidu map"
        navigationController?.pushViewController(mainView, animated: true)
    }
}
