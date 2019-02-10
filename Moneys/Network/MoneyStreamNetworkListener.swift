//
//  MoneyStreamNetworkListener.swift
//  Moneys
//
//  Created by Arthur Papailhau on 10/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import Firebase
import SwiftyJSON

final class MoneyStreamNetworkListener {
    
    private let mutableMoneyStream: MutableMoneyStreaming
    private lazy var functions = Functions.functions()
    
    init(mutableMoneyStream: MutableMoneyStreaming) {
        self.mutableMoneyStream = mutableMoneyStream
    }
    
    func startListener() {
        listen()
    }
    
    private func listen() {
        
        functions.httpsCallable("getMoneys").call() { (result, error) in
            if let error = error as NSError? {
            }
            var moneys: [Money] = []
            if let defaultMoneys = (result?.data as? [String: Any])?["defaultMoneys"] {
                let json = JSON(defaultMoneys)
                for (key, subJson):(String, JSON) in json {
                    print(key, subJson)
                    if let defaultMoney = self.parseDefaultMoneys(key: key, subJson: subJson) {
                        moneys.append(defaultMoney)
                    }
                }
            }
            if let stocks = (result?.data as? [String: Any])?["stockMoneys"] {
                let json = JSON(stocks)
                for (key, subJson):(String, JSON) in json {
                    print(key, subJson)
                    if let stockMoney = self.parseStockMoneys(key: key, subJson: subJson) {
                        moneys.append(stockMoney)
                    }
                }
            }
            self.mutableMoneyStream.update(moneys)
        }
    }

    private func parseDefaultMoneys(key: String, subJson: JSON) -> Money? {
        guard let amount = subJson["amount"].string else { return nil }
        return Money(moneyType: .today, amount: amount, description: "Today", isPositive: true)
    }
    
    private func parseStockMoneys(key: String, subJson: JSON) -> Money? {
        guard let todayAmount = subJson["todayAmount"].string else { return nil }
        return Money(moneyType: .companyStock, todayAmount: todayAmount, todayPourcentage: "+2%", cumulatedAmount: "+10€", cumulatedPourcentage: "+3%", stockName: "Facebook", isTodayPositive: true, isCumulatedPositive: true)
    }
}
