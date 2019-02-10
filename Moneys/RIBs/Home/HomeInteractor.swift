//
//  HomeInteractor.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    func setMoneysUIData(defaultMoneysUIData: [DefaultMoneyUIData], stockMoneysUIData: [StockMoneyUIData])
}

protocol HomeListener: class {}

struct DefaultMoneyUIData {
    let moneyType: CardType
    let amount: String
    let description: String
    let isPositive: Bool
}

struct StockMoneyUIData {
    let moneyType: CardType
    let todayAmount: String
    let todayPourcentage: String
    let cumulatedAmount: String
    let cumulatedPourcentage: String
    let stockName: String
    let isTodayPositive: Bool
    let isCumulatedPositive: Bool
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {
    weak var router: HomeRouting?
    weak var listener: HomeListener?

    private let moneyStream: MoneyStreaming
    private let networkListener: NetworkListener
    
    init(presenter: HomePresentable,
         moneyStream: MoneyStreaming,
         networkListener: NetworkListener) {
        self.moneyStream = moneyStream
        self.networkListener = networkListener
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        moneyStream
            .moneys
            .subscribe(onNext: { (moneys) in
                let (defaultMoneysUIData, stockMoneysUIData) = self.createMomeysUIData(moneys: moneys)
                self.presenter.setMoneysUIData(defaultMoneysUIData: defaultMoneysUIData,
                                               stockMoneysUIData: stockMoneysUIData)
            })
            .disposeOnDeactivate(interactor: self)
    }
    
    // MARK: - HomePresentableListener
    
    func getMoneys() {
        networkListener.getMoneys()
    }
    
    // MARK: - Private
    
    private func createMomeysUIData(moneys: [Money]) -> ([DefaultMoneyUIData], [StockMoneyUIData]) {
        var defaultMoneysUIData: [DefaultMoneyUIData] = []
        var stockMoneysUIData: [StockMoneyUIData] = []
        for money in moneys {
            if money.moneyType == .today || money.moneyType == .cumulated {
                if let amount = money.amount,
                    let description = money.description,
                    let isPositive = money.isPositive {
                    let defaultMoneyUIData = DefaultMoneyUIData(moneyType: money.moneyType,
                                                                amount: amount,
                                                                description: description,
                                                                isPositive: isPositive)
                    defaultMoneysUIData.append(defaultMoneyUIData)
                }
            } else {
                if let todayAmount = money.todayAmount,
                    let todayPourcentage = money.todayPourcentage,
                    let cumulatedAmount = money.cumulatedAmount,
                    let cumulatedPourcentage = money.cumulatedPourcentage,
                    let stockName = money.stockName,
                    let isTodayPositive = money.isTodayPositive,
                    let isCumulatedPositive = money.isCumulatedPositive {
                    let stockMoneyUIData = StockMoneyUIData(moneyType: money.moneyType,
                                                              todayAmount: todayAmount,
                                                              todayPourcentage: todayPourcentage,
                                                              cumulatedAmount: cumulatedAmount,
                                                              cumulatedPourcentage: cumulatedPourcentage,
                                                              stockName: stockName,
                                                              isTodayPositive: isTodayPositive,
                                                              isCumulatedPositive: isCumulatedPositive)
                    stockMoneysUIData.append(stockMoneyUIData)
                }
            }
        }
        return (defaultMoneysUIData, stockMoneysUIData)
    }
}
