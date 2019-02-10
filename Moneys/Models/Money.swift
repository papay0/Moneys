//
//  Money.swift
//  Moneys
//
//  Created by Arthur Papailhau on 10/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

// This model will change
final class Money {
    
    let moneyType: CardType
    
    // default
    let amount: String? = nil
    let description: String? = nil
    
    // stock
    let todayAmount: String? = nil
    let todayPourcentage: String? = nil
    let cumulatedAmount: String? = nil
    let cumulatedPourcentage: String? = nil
    let stockName: String? = nil
    
    init(moneyType: CardType) {
        self.moneyType = moneyType
    }
}
