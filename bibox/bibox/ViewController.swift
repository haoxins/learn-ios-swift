//
//  ViewController.swift
//  bibox
//
//  Created by hx on 4/25/16.
//  Copyright © 2016 hx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: UIButton) {
        print(userTextField.text)
        print(passTextField.text)
    }
}
