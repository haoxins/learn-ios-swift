
import Foundation
import UIKit

func newAlert(title: String, message: String, ok: String = "OK") -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: ok, style: .default, handler: nil)
    alertController.addAction(alertAction)
    return alertController
}
