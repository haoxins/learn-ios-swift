
import UIKit

class ViewController: UIViewController {
    var backFrom: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        
        let label = newLabel([
            "text": self.backFrom,
            "frame": CGRect(x: 30, y: 20, width: 140, height: 30)
        ])

        view.addSubview(label)

        // 1
        let btn01 = newButton([
            "title": "collection view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 60, width: 140, height: 30)
        ])

        btn01.addTarget(self, action: #selector(ViewController.gotoCollView), for: .touchUpInside)
        
        view.addSubview(btn01)
        // 2
        let btn02 = newButton([
            "title": "table view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 100, width: 140, height: 30)
        ])
        
        btn02.addTarget(self, action: #selector(ViewController.gotoTableView), for: .touchUpInside)
        
        view.addSubview(btn02)
        // 3
        let btn03 = newButton([
            "title": "web view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 140, width: 140, height: 30)
        ])

        btn03.addTarget(self, action: #selector(ViewController.gotoWebView), for: .touchUpInside)
        
        view.addSubview(btn03)
        // 4
        let btn04 = newButton([
            "title": "wx web view",
            "radius": 5,
            "frame": CGRect(x: 30, y: 180, width: 140, height: 30)
            ])
        
        btn04.addTarget(self, action: #selector(ViewController.gotoWXWebView), for: .touchUpInside)

        view.addSubview(btn04)
        // 5
        let btn05 = newButton([
            "title": "baidu map",
            "radius": 5,
            "frame": CGRect(x: 30, y: 220, width: 140, height: 30)
        ])

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

