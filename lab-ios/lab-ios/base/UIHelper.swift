
import Foundation
import UIKit

func newButton(_ opts: [String: Any]) -> UIButton {
    
    let btn = UIButton()
    
    if let title = opts["title"] as? String {
        btn.setTitle(title, for: .normal)
    }
    
    if let color = opts["color"] as? UIColor {
        btn.setTitleColor(color, for: .normal)
    }
    
    if let bgColor = opts["bgColor"] as? UIColor {
        btn.backgroundColor = bgColor
    }
    
    if let radius = opts["radius"] as? Int {
        btn.layer.cornerRadius = CGFloat(radius)
    }
    
    if let font = opts["font"] as? UIFont{
        btn.titleLabel!.font = font
    }
    
    if let frame = opts["frame"] as? CGRect {
        btn.frame = frame
    }
    
    return btn
}

func newLabel(_ opts: [String: Any]) -> UILabel {
    let label = UILabel()
    
    if let text = opts["text"] as? String {
        label.text = text
    }
    
    if let color = opts["color"] as? UIColor {
        label.textColor = color
    }
    
    if let bgColor = opts["bgColor"] as? UIColor {
        label.backgroundColor = bgColor
    }
    
    if let frame = opts["frame"] as? CGRect {
        label.frame = frame
    }
    
    if let fitWidth = opts["fitWidth"] as? Bool {
        label.adjustsFontSizeToFitWidth = fitWidth
    }
    
    // label.adjustsFontForContentSizeCategory = true
    
    return label
}

        }
        }
    }
    }
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
