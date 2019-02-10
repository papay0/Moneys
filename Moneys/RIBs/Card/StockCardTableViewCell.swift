//
//  CardTableViewCell.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit
import SnapKit

class StockCardTableViewCell: UITableViewCell {
    
    private let cardView: StockCardView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        cardView = StockCardView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildCell()
        setupCell()
    }
    
    func set(todayAmount: String,
             todayPourcentage: String,
             cumulatedAmount: String,
             cumulatedPourcentage: String) {
        cardView.set(todayAmount: todayAmount,
                     todayPourcentage: todayPourcentage,
                     cumulatedAmount: cumulatedAmount,
                     cumulatedPourcentage: cumulatedPourcentage)
    }
    
    func set(stockName: String) {
        cardView.set(stockName: stockName)
    }
    
    func set(isTodayPositive: Bool, isCumulativePositive: Bool) {
        cardView.set(isTodayPositive: isTodayPositive, isCumulativePositive: isCumulativePositive)
    }
    
    // MARK: - Private
    
    private func buildCell() {
        addSubview(cardView)
    }
    
    private func setupCell() {
        cardView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
