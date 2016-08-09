
import Foundation
import WebKit
import UIKit

class MyWKWebView: UIViewController, WKScriptMessageHandler {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray

        let webView = self.initWXWebView()

        view.addSubview(webView)

        // back btn
        let backBtn = newButton([
            "title": "back",
            "radius": 5,
            "frame": CGRect(x: 10, y: 10, width: 40, height: 30)
        ])
        
        backBtn.addTarget(self, action: #selector(MyWKWebView.gotoMain), for: .touchUpInside)

        webView.addSubview(backBtn)

    }

    func initWXCnfig() -> WKWebViewConfiguration {
        let contentController = WKUserContentController()

        let userScript = WKUserScript(
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )

        contentController.addUserScript(userScript)

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        return config
    }
    
    func initWXWebView() -> WKWebView {
        let webView = WKWebView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height),
            configuration: self.initWXCnfig()
        )

        let req = URLRequest(url: URL(string: "http://localhost:3000")!)
        print("goto page")
        webView.load(req)

        return webView
    }


    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "wx web view"
        navigationController?.pushViewController(mainView, animated: true)
    }
}
