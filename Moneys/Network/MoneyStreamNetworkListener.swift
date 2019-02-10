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
        Money(moneyType: .today),
        Money(moneyType: .cumulated),
        Money(moneyType: .companyStock)
    ]
    
    init(mutableMoneyStream: MutableMoneyStreaming) {
        self.mutableMoneyStream = mutableMoneyStream
        listen()
    }
    
    private func listen() {
        // make the network for now
        mutableMoneyStream.update(mockMoneys)
    }
}
