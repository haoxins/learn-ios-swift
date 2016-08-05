
import Foundation
import UIKit

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let items = ["one", "two", "three", "four", "five"]
    let cellIndetifier = "TextCell"
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray

        // back btn
        let backBtn = newButton([
            "title": "back",
            "radius": 5,
            "frame": CGRect(x: 10, y: 10, width: 40, height: 30)
        ])

        backBtn.addTarget(self, action: #selector(TableView.gotoMain), for: .touchUpInside)
        
        view.addSubview(backBtn)
        
        self.initTableView()
    }

    func initTableView() {
        table.delegate = self
        table.dataSource = self
        
        table.frame = CGRect(x: 0, y: 40, width: view.frame.width, height: view.frame.height - 40)

        view.addSubview(table)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIndetifier)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.detailTextLabel?.text = items[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        print("select: \(indexPath.row), text: \(items[indexPath.row])")
    }

    func gotoMain() {
        let mainView = ViewController()
        navigationController?.pushViewController(mainView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
