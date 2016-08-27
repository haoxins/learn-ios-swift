
import Foundation
import UIKit

/**
 * UIColor
 */
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

/**
 * UIButton
 */
extension UIButton {

    var title: String! {
        set (v) {
            self.setTitle(v, for: .normal)
        }

        get {
            return self.titleLabel?.text
        }
    }

    var titleFont: UIFont! {
        set (v) {
            self.titleLabel?.font = v
        }

        get {
            return self.titleLabel?.font
        }
    }

    var color: UIColor! {
        set (v) {
            self.setTitleColor(v, for: .normal)
        }

        get {
            return self.titleLabel?.textColor
        }
    }

    var radius: CGFloat! {
        set (v) {
            self.layer.cornerRadius = v
        }

        get {
            return self.layer.cornerRadius
        }
    }
}
