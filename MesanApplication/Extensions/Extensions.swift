//
//  Extensions.swift
//  MesanApplication
//
//  Created by galiev nail on 29.03.2021.
//

import Foundation
import UIKit
import Firebase

extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension UIColor {
    convenience init? (hexValue: String, alpha: CGFloat) {
        if hexValue.hasPrefix("#") {
            let scanner = Scanner(string: hexValue)
            scanner.scanLocation = 1
            var hexInt32: UInt32 = 0
            if hexValue.count == 7 {
                if scanner.scanHexInt32(&hexInt32) {
                    let red = CGFloat((hexInt32 & 0xFF0000) >> 16) / 255
                    let green = CGFloat((hexInt32 & 0x00FF00) >> 8) / 255
                    let blue = CGFloat(hexInt32 & 0x0000FF) / 255
                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            }
        }
        return nil
    }
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
    }
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return L10n.Error.emailAlreadyInUse
        case .userNotFound:
            return L10n.Error.userNotFound
        case .userDisabled:
            return L10n.Error.userDisabled
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return L10n.Error.invalidEmail
        case .networkError:
            return L10n.Error.networkError
        case .weakPassword:
            return L10n.Error.weakPassword
        case .wrongPassword:
            return L10n.Error.wrongPassword
        default:
            return L10n.Error.error
        }
    }
}

extension UIViewController{
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: L10n.Error.error, message: errorCode.errorMessage, preferredStyle: .alert)

            let okAction = UIAlertAction(title: L10n.Common.done, style: .default, handler: nil)

            alert.addAction(okAction)

            self.present(alert, animated: true, completion: nil)
        }
    }

}
