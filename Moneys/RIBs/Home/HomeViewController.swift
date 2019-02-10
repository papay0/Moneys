//
//  HomeViewController.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/12/2018.
//  Copyright © 2018 Arthur Papailhau. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
}

protocol HomeViewControllerDependency {}

final class HomeViewController: UITableViewController, HomePresentable, HomeViewControllable, HomeViewControllerDependency {
    
    weak var listener: HomePresentableListener?
    fileprivate var defaultMoneysUIData: [DefaultMoneyUIData] = []
    fileprivate var stockMoneysUIData: [StockMoneyUIData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - HomePresentable
    
    func setMoneysUIData(defaultMoneysUIData: [DefaultMoneyUIData], stockMoneysUIData: [StockMoneyUIData]) {
        for defaultMoneyUIData in defaultMoneysUIData {
            self.defaultMoneysUIData.append(defaultMoneyUIData)
        }
        for stockMoneyUIData in stockMoneysUIData {
            self.stockMoneysUIData.append(stockMoneyUIData)
        }
        tableView.reloadData()
    }
    
    // MARK: Private
    
    private func setupTableView() {
        tableView.register(DefaultCardTableViewCell.self, forCellReuseIdentifier: "defaultCardCell")
        tableView.register(StockCardTableViewCell.self, forCellReuseIdentifier: "stockCardCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return defaultMoneysUIData.count
        } else {
            return stockMoneysUIData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let card = defaultMoneysUIData[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCardCell", for: indexPath) as! DefaultCardTableViewCell
            cell.set(amount: card.amount)
            cell.set(description: card.description)
            cell.set(isPositive: card.isPositive)
            cell.selectionStyle = .none
            return cell
        } else {
            let card = stockMoneysUIData[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "stockCardCell", for: indexPath) as! StockCardTableViewCell
            cell.set(todayAmount: card.todayAmount,
                     todayPourcentage: card.todayPourcentage,
                     cumulatedAmount: card.cumulatedAmount,
                     cumulatedPourcentage: card.cumulatedPourcentage)
            cell.set(stockName: card.stockName)
            cell.set(isTodayPositive: card.isTodayPositive, isCumulativePositive: card.isCumulatedPositive)
            cell.selectionStyle = .none
            return cell
        }
    }
}
