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
    let amount: String?
    let description: String?
    let isPositive: Bool?
    
    // stock
    let todayAmount: String?
    let todayPourcentage: String?
    let cumulatedAmount: String?
    let cumulatedPourcentage: String?
    let stockName: String?
    let isTodayPositive: Bool?
    let isCumulatedPositive: Bool?
    
    init(moneyType: CardType,
         amount: String? = nil,
         description: String? = nil,
         isPositive: Bool? = nil,
         todayAmount: String? = nil,
         todayPourcentage: String? = nil,
         cumulatedAmount: String? = nil,
         cumulatedPourcentage: String? = nil,
         stockName: String? = nil,
         isTodayPositive: Bool? = nil,
         isCumulatedPositive: Bool? = nil) {
        self.moneyType = moneyType
        
        self.amount = amount
        self.description = description
        self.isPositive = isPositive
        
        self.todayAmount = todayAmount
        self.todayPourcentage = todayPourcentage
        self.cumulatedAmount = cumulatedAmount
        self.cumulatedPourcentage = cumulatedPourcentage
        self.stockName = stockName
        self.isTodayPositive = isTodayPositive
        self.isCumulatedPositive = isCumulatedPositive
    }
}
