//
//  LoggedInBuilder.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency>, HomeDependency {
    
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }
    
    var mutableMoneyStream: MutableMoneyStreaming {
        return shared { MoneyStream() }
    }
    
    var networkListener: NetworkListener {
        return shared { NetworkListener(mutableMoneyStream: mutableMoneyStream) }
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(with listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(with listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let interactor = LoggedInInteractor(networkListener: component.networkListener)
        interactor.listener = listener

        let homeBuilder = HomeBuilder(dependency: component)

        return LoggedInRouter(interactor: interactor,
                              viewController: component.loggedInViewController,
                              homeBuilder: homeBuilder)
    }
}
