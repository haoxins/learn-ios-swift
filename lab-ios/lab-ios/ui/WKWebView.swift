
import Foundation
import WebKit
import UIKit

class MyWKWebView: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    var webView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray

        let webView = self.initWXWebView()
        self.webView = webView

        view.addSubview(webView)

        webView.addSubview(self.getBackBtn())

        webView.evaluateJavaScript("add()", completionHandler: nil)
    }

    func initWXCnfig() -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        // execute
        contentController.addUserScript(WKUserScript(
            forMainFrameOnly: true
        ))

        contentController.addUserScript(WKUserScript(
            source: "add()",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        ))

        // listen to web view
        contentController.add(self, name: "webviewCall")

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        return config
    }
    
    func initWXWebView() -> WKWebView {
        let webView = WKWebView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height),
            configuration: self.initWXCnfig()
        )

        webView.navigationDelegate = self

        let req = URLRequest(url: URL(string: "http://localhost:3000")!)
        print("wk: goto page")
        webView.load(req)

        return webView
    }
    // message from web view
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("wk: name: \(message.name), body: \(message.body)")
        if message.name == "webviewCall" {
            if message.body.contains("goto map") {
                self.gotoMap()
            } else if message.body.contains("call me") {
                self.sendMessageToWebView("this is ios native")
            }
        }
    }

    func sendMessageToWebView(_ message: String) {
        let date = Date()
        let code = "add(); onNativeMessage('send from ios: \(date)')"
        self.webView?.evaluateJavaScript(code, completionHandler: {
            (any, err) -> Void in
                print("wk: evaluate finished")
        })
    }

    func getBackBtn() -> UIButton {
        let backBtn = newButton([
            "title": "back",
            "radius": 5,
            "frame": CGRect(x: 10, y: 10, width: 40, height: 30)
        ])

        backBtn.addTarget(self, action: #selector(MyWKWebView.gotoMain), for: .touchUpInside)
        
        return backBtn
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "wk web view"
        navigationController?.pushViewController(mainView, animated: true)
    }

    func gotoMap() {
        let mapView = BaiduMapView()
        navigationController?.pushViewController(mapView, animated: true)
    }

    // hooks
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("wk: commit")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("wk: finish")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("wk: fail")
    }
}
