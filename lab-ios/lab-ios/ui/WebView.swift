
import Foundation
import UIKit

//
// WebView: call native, create special network request (oh, god)
//

class WebView: UIViewController, UIWebViewDelegate {
    var webView: UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray

        let webView = self.initWebView()
        self.webView = webView

        view.addSubview(webView)

        webView.addSubview(self.getBackBtn())
    }

    func initWebView() -> UIWebView {
        let webView = UIWebView()
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        webView.delegate = self
        
        let req = URLRequest(url: URL(string: "http://localhost:3000")!)
        print("goto page")
        webView.loadRequest(req)

        return webView
    }

    func getBackBtn() -> UIButton {
        let backBtn = UIButton() { b in
            b.title = "back"
            b.radius = 5
            b.frame = CGRect(x: 10, y: 10, width: 40, height: 30)

            b.addTarget(self, action: #selector(WebView.gotoMain), for: .touchUpInside)
        }

        return backBtn
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "web view"
        navigationController?.pushViewController(mainView, animated: true)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        let result = self.webView?.stringByEvaluatingJavaScript(from: "add()")
        print("wv: \(result)")
    }
}
