//
//  ViewController.swift
//  hello-snapkit
//
//  Created by hx on 5/5/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "hello snapkit"
        view.backgroundColor = UIColor.whiteColor()

        // topbar
        let topbar = UILabel()
        topbar.backgroundColor = UIColor(rgb: colorMain)

        let label = UILabel()
        // label
        label.text = "米奇公园"
        label.textColor = UIColor.whiteColor()
        label.adjustsFontSizeToFitWidth = true

        topbar.addSubview(label)
        label.snp_makeConstraints{ (make) -> Void in
            make.right.top.equalTo(22)
            make.bottom.equalTo(12)
            make.width.equalTo(62)
        }

        view.addSubview(topbar)
        topbar.snp_makeConstraints{ (make) -> Void in
            make.height.equalTo(48)
            make.width.equalTo(view)
        }

        let main = UIView()
        main.backgroundColor = UIColor(rgb: colorGray)

        view.addSubview(main)
        main.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(48, 0, 0, 0))
        }

        let nameText = UITextField()
//        nameText.placeholderRectForBounds(CGRect(x: 10, y: 10, width: 10, height: 10))
        nameText.backgroundColor = UIColor.whiteColor()
        nameText.placeholder = "请输入用户名"

        let passText = UITextField()
//        passText.placeholderRectForBounds(CGRect(x: 10, y: 10, width: 10, height: 10))
        passText.backgroundColor = UIColor.whiteColor()
        passText.placeholder = "请输入密码"

        let btn = UIButton()
        btn.backgroundColor = UIColor(rgb: colorMain)
        btn.layer.cornerRadius = 18
        btn.setTitle("√", forState: .Normal)

        btn.addTarget(self, action: "clickSignin:", forControlEvents: .TouchUpInside)

        main.addSubview(nameText)
        nameText.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(36)
        }

        main.addSubview(passText)
        passText.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(100 + 36 + 10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(36)
        }

        main.addSubview(btn)
        btn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(100 + (36 + 10) * 2)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(36)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // submit
    func clickSignin(sender: UIButton!) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let callView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("CallController")
        self.presentViewController(callView, animated: true) {
            print("Oh, new view")
        }
    }
}
