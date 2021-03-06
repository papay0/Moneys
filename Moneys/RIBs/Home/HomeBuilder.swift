//
//  HomeBuilder.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol HomeDependency: Dependency {
    var mutableMoneyStream: MutableMoneyStreaming { get }
    var networkListener: NetworkListener { get }
}

final class HomeComponent: Component<HomeDependency> {
    fileprivate var moneyStream: MoneyStreaming {
        return dependency.mutableMoneyStream
    }
    
    fileprivate var networkListener: NetworkListener {
        return dependency.networkListener
    }
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(with listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(with listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()

        let interactor = HomeInteractor(presenter: viewController,
                                        moneyStream: component.moneyStream,
                                        networkListener: component.networkListener)
        interactor.listener = listener

        return HomeRouter(interactor: interactor,
                          viewController: viewController)
    }
}
