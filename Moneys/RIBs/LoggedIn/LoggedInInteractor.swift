//
//  LoggedInInteractor.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func cleanupViews()
}

protocol LoggedInListener: class {
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    init(networkListener: NetworkListener) {
        self.networkListener = networkListener
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        startListeners()
    }
    
    // MARK: - Private
    
    private func startListeners() {
        networkListener.startListeners()
    }
    
    private let networkListener: NetworkListener
}
