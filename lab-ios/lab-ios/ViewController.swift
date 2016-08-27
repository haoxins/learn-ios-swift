
import UIKit

class ViewController: UIViewController {
    var backFrom: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan

        let label = UILabel()
        label.text = self.backFrom
        label.frame = CGRect(x: 30, y: 20, width: 140, height: 30)

        view.addSubview(label)

        // 1
        let btn01 = UIButton()
        btn01.title = "collection view"
        btn01.radius = 5
        btn01.frame = CGRect(x: 30, y: 60, width: 140, height: 30)

        btn01.addTarget(self, action: #selector(ViewController.gotoCollView), for: .touchUpInside)
        
        view.addSubview(btn01)
        // 2
        let btn02 = UIButton()
        btn02.title = "table view"
        btn02.radius = 5
        btn02.frame = CGRect(x: 30, y: 100, width: 140, height: 30)

        btn02.addTarget(self, action: #selector(ViewController.gotoTableView), for: .touchUpInside)
        
        view.addSubview(btn02)
        // 3
        let btn03 = UIButton()
        btn03.title = "web view"
        btn03.radius = 5
        btn03.frame = CGRect(x: 30, y: 140, width: 140, height: 30)

        btn03.addTarget(self, action: #selector(ViewController.gotoWebView), for: .touchUpInside)
        
        view.addSubview(btn03)
        // 4
        let btn04 = UIButton()
        btn04.title = "wk web view"
        btn04.radius = 5
        btn04.frame = CGRect(x: 30, y: 180, width: 140, height: 30)

        btn04.addTarget(self, action: #selector(ViewController.gotoWXWebView), for: .touchUpInside)

        view.addSubview(btn04)
        // 5
        let btn05 = UIButton()
        btn05.title = "baidu map"
        btn05.radius = 5
        btn05.frame = CGRect(x: 30, y: 220, width: 140, height: 30)

        btn05.addTarget(self, action: #selector(ViewController.gotoBaiduMap), for: .touchUpInside)

        view.addSubview(btn05)
    }

    func gotoCollView() {
        let collView = CollectionView()
        navigationController?.pushViewController(collView, animated: true)
    }

    func gotoTableView() {
        let tableView = TableView()
        navigationController?.pushViewController(tableView, animated: true)
    }

    func gotoWebView() {
        let webView = WebView()
        navigationController?.pushViewController(webView, animated: true)
    }
    
    func gotoWXWebView() {
        let wxWebView = MyWKWebView()
        navigationController?.pushViewController(wxWebView, animated: true)
    }

    func gotoBaiduMap() {
        let baiduMap = BaiduMapView()
        navigationController?.pushViewController(baiduMap, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

