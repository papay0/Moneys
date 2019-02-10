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
    
    fileprivate let defaultCardType: [CardType] = [.today, .cumulated]
    fileprivate let stockCardType: [CardType] = [.companyStock, .companyStock, .companyStock]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
            return defaultCardType.count
        } else {
            return stockCardType.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCardCell", for: indexPath) as! DefaultCardTableViewCell
            let cardUIData = getDefaultCardUIData(cardType: defaultCardType[indexPath.row])
            cell.set(amount: cardUIData.amount)
            cell.set(description: cardUIData.description)
            cell.set(isPositive: cardUIData.isPositive)
            cell.selectionStyle = .none
            return cell
        } else { // it's a stock section
            let cell = tableView.dequeueReusableCell(withIdentifier: "stockCardCell", for: indexPath) as! StockCardTableViewCell
            let cardUIData = getStockCardUIData()
            cell.set(todayAmount: cardUIData.amountToday, todayPourcentage: cardUIData.pourcentageToday, cumulatedAmount: "-23€", cumulatedPourcentage: "-3%")
            cell.set(stockName: cardUIData.stockName)
            cell.set(isTodayPositive: true, isCumulativePositive: false)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    private func getDefaultCardUIData(cardType: CardType) -> DefaultCardUIData {
        let cardUIData: DefaultCardUIData
        switch cardType {
        case .today:
            cardUIData = DefaultCardUIData(amount: "+120€", description: "Today", isPositive: true)
        case .cumulated:
            cardUIData = DefaultCardUIData(amount: "-12€", description: "Cumulated", isPositive: false)
        case .companyStock: // TODO: To remove when backend model
            cardUIData = DefaultCardUIData(amount: "-37€", description: "Tesla", isPositive: false)
        }
        return cardUIData
    }
    
    private func getStockCardUIData() -> StockCardUIData { // This will change when I do the backend models
        return StockCardUIData(amountToday: "+1€",
                               pourcentageToday: "+2%",
                               isTodayPositive: true,
                               isCumulatedPositive: false,
                               stockName: "Tesla")
    }
}
