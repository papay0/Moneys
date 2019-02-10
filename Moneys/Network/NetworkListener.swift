//
//  NetworkListener.swift
//  Moneys
//
//  Created by Arthur Papailhau on 10/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

final class NetworkListener {
    
    init(mutableMoneyStream: MutableMoneyStreaming) {
        moneyStreamNetworkListener = MoneyStreamNetworkListener(mutableMoneyStream: mutableMoneyStream)
    }
    
    func startListeners() {
        moneyStreamNetworkListener.startListener()
    }
    
    // MARK: - Private
    
    private let moneyStreamNetworkListener: MoneyStreamNetworkListener
}
