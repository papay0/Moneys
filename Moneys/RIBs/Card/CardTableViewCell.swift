//
//  CardTableViewCell.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit
import SnapKit

class CardTableViewCell: UITableViewCell {

    private let cardView: CardView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        cardView = CardView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildCell()
        setupCell()
    }
    
    func set(amount: String) {
        cardView.set(amount: amount)
    }
    
    func set(description: String) {
        cardView.set(description: description)
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
