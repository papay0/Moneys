//
//  HomeBuilder.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs

protocol HomeDependency: Dependency {
}

final class HomeComponent: Component<HomeDependency> {
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
        let _ = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()

        let interactor = HomeInteractor(presenter: viewController)
        interactor.listener = listener

        return HomeRouter(interactor: interactor,
                          viewController: viewController)
    }
}
