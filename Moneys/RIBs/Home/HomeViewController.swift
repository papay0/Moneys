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
    
    fileprivate let cardType: [CardType] = [.today, .cumulated, .companyStock]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: Private
    
    private func setupTableView() {
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "cardCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardType.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
        let cardUIData = getCardUIData(cardType: cardType[indexPath.row])
        cell.set(amount: cardUIData.amount)
        cell.set(description: cardUIData.description)
        cell.set(isPositive: cardUIData.isPositive)
        cell.selectionStyle = .none
        return cell
    }
    
    private func getCardUIData(cardType: CardType) -> CardUIData {
        let cardUIData: CardUIData
        switch cardType {
        case .today:
            cardUIData = CardUIData(amount: "+120€", description: "Today", isPositive: true)
        case .cumulated:
            cardUIData = CardUIData(amount: "+12€", description: "Cumulated", isPositive: true)
        case .companyStock:
            cardUIData = CardUIData(amount: "-37€", description: "Tesla", isPositive: false)
        }
        return cardUIData
    }
}
