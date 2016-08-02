//
//  kit.swift
//  test-swift-pkg
//
//  Created by hx on 8/1/16.
//  Copyright © 2016 hx. All rights reserved.
//

import Foundation
import UIKit

func newButton(opts: [String: Any]) -> UIButton {

    let btn = UIButton()
    
    if let title = opts["title"] {
        btn.setTitle(String(title), for: .normal)
    }
    
    if let color = opts["color"] {
        btn.setTitleColor(color as! UIColor, for: .normal)
    }
    
    if let bgColor = opts["bgColor"] {
        btn.backgroundColor = bgColor as! UIColor
    }
    
    if let radius = opts["radius"] {
        btn.layer.cornerRadius = CGFloat(radius as! Int)
    }
    
    if let font = opts["font"] {
        btn.titleLabel!.font = font as! UIFont
    }

    if let frame = opts["frame"] {
        btn.frame = frame as! CGRect
    }

    return btn
}

func newLabel(opts: [String: Any]) -> UILabel {
    let label = UILabel()
    
    if let text = opts["text"] {
        label.text = text as! String
    }
    
    if let color = opts["color"] {
        label.textColor = color as! UIColor
    }
    
    if let bgColor = opts["bgColor"] {
        label.backgroundColor = bgColor as! UIColor
    }

    if let frame = opts["frame"] {
        label.frame = frame as! CGRect
    }
    
    if let fitWidth = opts["fitWidth"] {
        label.adjustsFontSizeToFitWidth = fitWidth as! Bool
    }

    // label.adjustsFontForContentSizeCategory = true

    return label
}

func newTextField(opts: [String: Any]) -> UITextField {
    let textField = UITextField()
    
    if let bgColor = opts["bgColor"] {
        textField.backgroundColor = bgColor as! UIColor
    }
    
    if let placeholder = opts["placeholder"] {
        textField.placeholder = placeholder as! String
    }

    if let frame = opts["frame"] {
        textField.frame = frame as! CGRect
    }

    return textField
}

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

