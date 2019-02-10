//
//  MoneyStreamNetworkListener.swift
//  Moneys
//
//  Created by Arthur Papailhau on 10/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

final class MoneyStreamNetworkListener {
    private let mutableMoneyStream: MutableMoneyStreaming
    
    private let mockMoneys: [Money] = [
        Money(moneyType: .today, amount: "+120€", description: "Today", isPositive: true),
        Money(moneyType: .cumulated, amount: "-12€", description: "Cumulated", isPositive: false),
        Money(moneyType: .companyStock, todayAmount: "+1€", todayPourcentage: "+2%", cumulatedAmount: "-23€", cumulatedPourcentage: "-3%", stockName: "Uber", isTodayPositive: true, isCumulatedPositive: false),
        Money(moneyType: .companyStock, todayAmount: "-1€", todayPourcentage: "-2%", cumulatedAmount: "-23€", cumulatedPourcentage: "-3%", stockName: "Tesla", isTodayPositive: false, isCumulatedPositive: false),
        Money(moneyType: .companyStock, todayAmount: "+1€", todayPourcentage: "+2%", cumulatedAmount: "+10€", cumulatedPourcentage: "+3%", stockName: "Facebook", isTodayPositive: true, isCumulatedPositive: true)
    ]
    
    init(mutableMoneyStream: MutableMoneyStreaming) {
        self.mutableMoneyStream = mutableMoneyStream
    }
    
    func startListener() {
        listen()
    }
    
    private func listen() {
        // make the network for now
        mutableMoneyStream.update(mockMoneys)
    }
}
