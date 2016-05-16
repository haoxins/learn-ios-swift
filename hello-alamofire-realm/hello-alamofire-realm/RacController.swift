//
//  RacController.swift
//  hello-alamofire-realm
//
//  Created by hx on 5/16/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit
import ReactiveCocoa

class RacController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let textField = UITextField()
        textField.backgroundColor = UIColor.blueColor()
        textField.placeholder = "search"
        textField.frame = CGRectMake(15, 50, 300, 20)
        view.addSubview(textField)

        let searchStrings = textField.rac_textSignal()
            .toSignalProducer()
            .map { text in text as! String }
            .throttle(0.5, onScheduler: QueueScheduler.mainQueueScheduler)
            .on(event: { print ($0) })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
