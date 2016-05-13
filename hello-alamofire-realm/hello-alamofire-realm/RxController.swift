//
//  RxController.swift
//  hello-alamofire-realm
//
//  Created by hx on 5/12/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBar = UISearchBar()
        searchBar.frame = CGRectMake(0, 0, 400, 50)
        searchBar.setShowsCancelButton(true, animated: true)
        view.addSubview(searchBar)

        let textView = UITextView()
        textView.frame = CGRectMake(0, 50, 400, 500)
        view.addSubview(textView)

        var count = 0
        let disposeBag = DisposeBag()

        let results = searchBar.rx_text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest {
                query -> Observable<String> in
                print(query)
                count += 1
                print(count)

                if query.isEmpty {
                    return  Observable.just("")
                }

                return Observable.just("pp")
            }
            .observeOn(MainScheduler.instance)

        results
            .bindTo(textView.rx_text)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
