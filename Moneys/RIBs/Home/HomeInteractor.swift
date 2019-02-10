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
    func setMoneysUIData(moneysUIData: [MoneysUIData])
}

protocol HomeListener: class {}

struct MoneysUIData {
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
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    private let moneyStream: MoneyStreaming
    
    init(presenter: HomePresentable, moneyStream: MoneyStreaming) {
        self.moneyStream = moneyStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        moneyStream
            .moneys
            .subscribe(onNext: { (moneys) in
                let moneysUIData = self.createMomeysUIData(moneys: moneys)
                self.presenter.setMoneysUIData(moneysUIData: moneysUIData)
            })
            .disposeOnDeactivate(interactor: self)
    }
    
    // MARK: - Private
    
    private func createMomeysUIData(moneys: [Money]) -> [MoneysUIData] {
        return moneys.map({ (money) -> MoneysUIData in
            return MoneysUIData(moneyType: money.moneyType)
        })
    }
}
