//
//  ViewController.swift
//  test-swift-pkg
//
//  Created by hx on 8/1/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.title = "hello swift package"
        view.backgroundColor = UIColor.cyan

        let btn = newButton([
            "title": "hello",
            "radius": 5,
            "font": UIFont.systemFont(ofSize: 22),
            "color": UIColor.blue,
            "bgColor": UIColor.white,
            "frame": CGRect(x: 15, y: 30, width: 100, height: 50)
        ])

        btn.addTarget(self, action: #selector(ViewController.onClick), for: .touchUpInside)
        
        view.addSubview(btn)
        
        let btn2 = newButton([
            "title": "goto",
            "color": UIColor(rgb: 0x00aeef),
            "frame": CGRect(x: 15, y: 80, width: 40, height: 30)
        ])

        btn2.addTarget(self, action: #selector(ViewController.gotoPage), for: .touchUpInside)

        view.addSubview(btn2)

        view.addSubview(newLabel([
            "text": "label~",
            "fitWidth": true,
            "color": UIColor.gray,
            "bgColor": UIColor.green,
            "frame": CGRect(x: 15, y: 120, width: 40, height: 30)
        ]))
        
        view.addSubview(newTextField([
            "placeholder": "hahaha",
            "bgColor": UIColor.blue,
            "frame": CGRect(x: 15, y: 160, width: 140, height: 30)
        ]))
    }
    
    
    func onClick(sender: UIButton!) {
        print("click !!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
