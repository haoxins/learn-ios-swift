
import Foundation
import UIKit

class BaiduMapView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray

        view.addSubview(self.getBackBtn())
    }

    func getBackBtn() -> UIButton {
        let backBtn = UIButton()
        backBtn.title = "back"
        backBtn.radius = 5
        backBtn.frame = CGRect(x: 10, y: 10, width: 40, height: 30)

        backBtn.addTarget(self, action: #selector(BaiduMapView.gotoMain), for: .touchUpInside)
        
        return backBtn
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "baidu map"
        navigationController?.pushViewController(mainView, animated: true)
    }
}
