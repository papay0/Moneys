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

struct DefaultCardUIData {
    let amount: String
    let description: String
    let isPositive: Bool
}

struct StockCardUIData { // TODO: To improve
    let amountToday: String
    let pourcentageToday: String
    let isTodayPositive: Bool
    let isCumulatedPositive: Bool
    let stockName: String
}
