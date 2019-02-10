//
//  MoneyStream.swift
//  Moneys
//
//  Created by Arthur Papailhau on 10/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import RxSwift

protocol MoneyStreaming: class {
    var moneys: Observable<[Money]> { get }
}

protocol MutableMoneyStreaming: MoneyStreaming {
    func update(_ moneys: [Money])
}

final class MoneyStream: MutableMoneyStreaming {
    
    init() {}
    
    func update(_ moneys: [Money]) {
        moneySubject.onNext(moneys)
    }
    
    var moneys: Observable<[Money]> {
        return moneySubject.asObservable()
    }
    
    // MARK: - Private
    
    private let moneySubject = BehaviorSubject<[Money]>(value: [])
}
