//
//  UIView+Extension.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 4.10.2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
