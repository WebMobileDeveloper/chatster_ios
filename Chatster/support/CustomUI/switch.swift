//
//  File.swift
//  Chatster
//
//  Created by Shanbo on 1/20/18.
//  Copyright © 2018 chat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class UISwitchCustom: UISwitch {
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor = OffTint
            self.layer.cornerRadius = 16
            self.backgroundColor = OffTint
        }
    }
}
