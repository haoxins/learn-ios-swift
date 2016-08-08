
import Foundation
import UIKit

class BaiduMapView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray

        // back btn
        let backBtn = newButton([
            "title": "back",
            "radius": 5,
            "frame": CGRect(x: 10, y: 10, width: 40, height: 30)
        ])

        backBtn.addTarget(self, action: #selector(WebView.gotoMain), for: .touchUpInside)

        view.addSubview(backBtn)
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "baidu map"
        navigationController?.pushViewController(mainView, animated: true)
    }
}
