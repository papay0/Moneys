//
//  Theme.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit

enum Theme {
    case positive
    case negative
    case grayish
    case borderCard
    case darkGray
    case white
}

extension Theme {
    var color: UIColor {
        var instanceColor = UIColor.clear
        switch self {
            case .positive:
                instanceColor = UIColor(red: 112, green: 211, blue: 139)
            case .negative:
                instanceColor = UIColor(red: 221, green: 113, blue: 117)
            case .grayish:
                instanceColor = UIColor.gray.withAlphaComponent(0.1)
            case .borderCard:
                instanceColor = UIColor.gray.withAlphaComponent(0.4)
            case .darkGray:
                instanceColor = .darkGray
            case .white:
                instanceColor = .white
            
        }
        return instanceColor
    }
}
