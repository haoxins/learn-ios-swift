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

        let textField = UITextField()
        textField.frame = CGRectMake(0, 90, 400, 40)
        view.addSubview(textField)

        let label = UILabel()
        label.frame = CGRectMake(0, 180, 400, 40)
        view.addSubview(label)

        [1, 2, 3, 4, 5, 6, 7, 8, 9]
            .toObservable()
            .filter {
                i in
                    return i > 1
            }
            .map {
                i in
                    return (String(i * 10))
            }
            .bindTo(textField.rx_text)


        textField
            .rx_text
            .bindTo(label.rx_text)

//
//        let textView = UITextView()
//        textView.frame = CGRectMake(0, 50, 400, 500)
//        view.addSubview(textView)
//
//        var count = 0
//        let disposeBag = DisposeBag()
//
//        let results = searchBar.rx_text
//            .throttle(0.3, scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .flatMapLatest {
//                query -> Observable<String> in
//                print(query)
//                count += 1
//                print(count)
//
//                if query.isEmpty {
//                    return  Observable.just("")
//                }
//
//                return Observable.just("pp")
//            }
//            .observeOn(MainScheduler.instance)
//
//        results
//            .bindTo(textView.rx_text)
//            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
