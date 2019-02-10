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
    
    func getMoneys() {
        listen()
    }
    
    private func listen() {
        
        functions.httpsCallable("getMoneys").call(["username": "", "password": "00000"]) { (result, error) in
            var moneys: [Money] = []
            if let defaultMoneys = (result?.data as? [String: Any])?["defaultMoneys"] {
                let json = JSON(defaultMoneys)
                for (key, subJson):(String, JSON) in json {
                    if let defaultMoney = self.parseDefaultMoneys(key: key, subJson: subJson) {
                        moneys.append(defaultMoney)
                    }
                }
            }
            if let stocks = (result?.data as? [String: Any])?["stockMoneys"] {
                let json = JSON(stocks)
                for (key, subJson):(String, JSON) in json {
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
        guard let description = subJson["description"].string else { return nil }
        guard let isPositive = subJson["isPositive"].bool else { return nil }
        return Money(moneyType: .today, amount: amount, description: description, isPositive: isPositive)
    }
    
    private func parseStockMoneys(key: String, subJson: JSON) -> Money? {
        guard let todayAmount = subJson["todayAmount"].string else { return nil }
        guard let todayPourcentage = subJson["todayPourcentage"].string else { return nil }
        guard let cumulatedAmount = subJson["cumulatedAmount"].string else { return nil }
        guard let cumulatedPourcentage = subJson["cumulatedPourcentage"].string else { return nil }
        guard let stockName = subJson["stockName"].string else { return nil }
        guard let isTodayPositive = subJson["isTodayPositive"].bool else { return nil }
        guard let isCumulatedPositive = subJson["isCumulatedPositive"].bool else { return nil }
        return Money(moneyType: .companyStock, todayAmount: todayAmount, todayPourcentage: todayPourcentage, cumulatedAmount: cumulatedAmount, cumulatedPourcentage: cumulatedPourcentage, stockName: stockName, isTodayPositive: isTodayPositive, isCumulatedPositive: isCumulatedPositive)
    }
}
