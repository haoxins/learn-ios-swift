
import UIKit
import SnapKit

class MAuthListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: colorGray)

        // topbar
        let topbar = UIView()
        topbar.backgroundColor = UIColor(rgb: colorMain)

        view.addSubview(topbar)
        topbar.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(0)
            make.height.equalTo(110)
        }

        // list
        let items = ["one", "two", "three", "four"]

        let list = UITableView()

        view.addSubview(list)
        list.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(110)
            make.left.right.equalTo(0)
        }
    }
}
