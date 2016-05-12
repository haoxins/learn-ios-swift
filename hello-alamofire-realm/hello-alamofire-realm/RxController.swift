//
//  RxController.swift
//  hello-alamofire-realm
//
//  Created by hx on 5/12/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit
import RxSwift

class RxController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBar = UISearchBar()
        searchBar.frame = CGRectMake(0, 0, 400, 50)
        view.addSubview(searchBar)

        let tabelView = UITableView()
        tabelView.frame = CGRectMake(0, 50, 400, 500)
        view.addSubview(tabelView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
