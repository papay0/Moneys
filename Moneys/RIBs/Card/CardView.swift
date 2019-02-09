//
//  CardView.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit

class CardView: View {
    
    private let containerView: View
    private let cardView: View
    private let topCardView: View
    
    private let amountLabel: UILabel
    
    private let marginCard = 10
    private let heightCard = 200
    private let heightTopCard = 120
    private let fontSizeAmount: CGFloat = 40
    
    override init() {
        containerView = View()
        cardView = View()
        topCardView = View()
        amountLabel = UILabel()
        super.init()
        configure()
    }
    
    override func build() {
        super.build()
        setupSubviews()
        setupLabels()
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(heightCard)
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        cardView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview().inset(marginCard)
        }
        
        topCardView.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(heightTopCard)
        }
        
        amountLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    override func style() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 6
        // cardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        cardView.backgroundColor = .blue
        topCardView.backgroundColor = .red
    }
    
    // MARK: - Private
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        cardView.addSubview(topCardView)
        topCardView.addSubview(amountLabel)
    }
    
    private func setupLabels() {
        amountLabel.text = "120e"
        amountLabel.textAlignment = .center
        amountLabel.font = amountLabel.font.withSize(fontSizeAmount)
        amountLabel.textColor = .white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

