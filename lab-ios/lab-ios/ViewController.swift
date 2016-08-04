
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        //
        let btn02 = newButton([
            "title": "table view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 60, width: 140, height: 30)
        ])
        
        btn02.addTarget(self, action: #selector(ViewController.gotoTableView), for: .touchUpInside)
        
        view.addSubview(btn02)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

