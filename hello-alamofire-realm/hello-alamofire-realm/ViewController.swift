//
//  ViewController.swift
//  hello-alamofire-realm
//
//  Created by hx on 5/8/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
//                print(response.request)
//                print(response.response)
//                print(response.data) // bin
                print(response.result)

                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }

                print("\n\n --- \n\n")

                let parameters = [
                    "foo": [1,2,3],
                    "bar": [
                        "baz": "qux"
                    ]
                ]

                Alamofire.request(.POST, "https://httpbin.org/post", parameters: parameters, encoding: .JSON)
                    .responseJSON { response in
                        print(response.result)

                        if let JSON = response.result.value {
                            print("JSON: \(JSON)")
                        }
                }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
