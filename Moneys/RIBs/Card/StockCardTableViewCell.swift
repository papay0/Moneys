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
    
    func set(amountToday: String) {
        cardView.set(amountToday: amountToday)
    }
    
    func set(pourcentageToday: String) {
        cardView.set(pourcentageToday: pourcentageToday)
    }
    
    func set(description: String) { // TODO: Update this method name
        cardView.set(stockName: description)
    }
    
    func set(isPositive: Bool) {
        cardView.set(isPositive: isPositive)
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
