//
//  File.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

enum CardType {
    case today
    case cumulated
    case companyStock
}

struct CardUIData {
    let amount: String
    let description: String
    let isPositive: Bool
}
