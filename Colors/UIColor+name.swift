//
//  UIColor+name.swift
//  Colors
//
//  Created by Zachary Gorak on 10/28/19.
//  Copyright © 2019 twodayslate. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var name: String {
        switch self {
        case .black:
            return "Black"
        case .blue:
            return "Blue"
        case .brown:
            return "Brown"
        case .clear:
            return "Clear"
        case .cyan:
            return "Cyan"
        case .darkGray:
            return "Dark Gray"
        case .darkText:
            return "Dark Text"
        case .gray:
            return "Gray"
        case .green:
            return "Green"
        case .label:
            return "Label"
        case .lightGray:
            return "Light Gray"
        case .lightText:
            return "Light Text"
        case .link:
            return "Link"
        case .magenta:
            return "Magenta"
        case .opaqueSeparator:
            return "Opaque Separator"
        case .orange:
            return "Orange"
        case .placeholderText:
            return "Placeholder Text"
        case .purple:
            return "Purple"
        case .red:
            return "Red"
        case .separator:
            return "Seperator"
        case .white:
            return "White"
        case .yellow:
            return "Yellow"
            
        case .systemBlue:
            return "System Blue"
        case .systemGreen:
            return "System Green"
        case .systemTeal:
            return "System Teal"
        case .systemRed:
            return "System Red"
        case .systemGray:
            return "System Gray"
        case .systemPink:
            return "System Pink"
        case .systemIndigo:
            return "System Indigo"
        case .systemOrange:
            return "System Orange"
        case .systemPurple:
            return "System Purple"

        case .systemGray:
            return "System Gray"
        case .systemGray2:
            return "System Gray 2"
        case .systemGray3:
            return "System Gray 3"
        case .systemGray4:
            return "System Gray 4"
        case .systemGray5:
            return "System Gray 5"
            case .systemGray6:
            return "System Gray 6"

        case .systemFill:
            return "System Fill"
        case .systemBackground:
            return "System Background"
        case .systemGroupedBackground:
            return "System Grouped Background"

            
        case .quaternaryLabel:
            return "Quaternary Label"
        case .quaternarySystemFill:
            return "quaternarySystemFill"
            
        case .secondarySystemBackground:
            return "secondarySystemBackground"
        case .secondarySystemGroupedBackground:
            return "secondarySystemGroupedBackground"
        case .secondaryLabel:
            return "secondaryLabel"
        case .secondarySystemFill:
            return "secondarySystemFill"

            
        case .tertiarySystemFill:
            return "tertiarySystemFill:"
        case .tertiaryLabel:
            return "tertiaryLabel"
        case .tertiarySystemBackground:
            return "tertiarySystemBackground"
        case .tertiarySystemGroupedBackground:
            return "tertiarySystemGroupedBackground"
            
        default:
            return "\(self)"
        }
    }
}
