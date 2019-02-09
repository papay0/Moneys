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
    private let bottomCardView: View
    
    private let amountLabel: UILabel
    private let descriptionLabel: UILabel
    
    private let marginTopCard = 10
    private let marginBottomCard = 10
    private let marginRightCard = 20
    private let marginLeftCard = 20
    private let heightCard = 200
    private let heightTopCard = 120
    private let fontSizeAmount: CGFloat = 40
    private let fontSizeDescription: CGFloat = 20
    
    override init() {
        containerView = View()
        cardView = View()
        topCardView = View()
        bottomCardView = View()
        amountLabel = UILabel()
        descriptionLabel = UILabel()
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
            make.top.equalToSuperview().inset(marginTopCard)
            make.bottom.equalToSuperview().inset(marginBottomCard)
            make.leading.equalToSuperview().inset(marginLeftCard)
            make.trailing.equalToSuperview().inset(marginRightCard)
        }
        
        topCardView.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(heightTopCard)
        }
        
        bottomCardView.snp.makeConstraints { (make) in
            make.top.equalTo(topCardView.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        amountLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    override func style() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 6
        cardView.layer.borderWidth = 0.7
        cardView.layer.borderColor = Theme.borderCard.color.cgColor
        
        topCardView.backgroundColor = Theme.positive.color
        bottomCardView.backgroundColor = Theme.grayish.color
    }
    
    // MARK: - Private
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        cardView.addSubview(topCardView)
        cardView.addSubview(bottomCardView)
        topCardView.addSubview(amountLabel)
        bottomCardView.addSubview(descriptionLabel)
    }
    
    private func setupLabels() {
        amountLabel.text = "+120€"
        amountLabel.textAlignment = .center
        amountLabel.font = UIFont.boldSystemFont(ofSize: fontSizeAmount)
        amountLabel.textColor = Theme.white.color
        
        descriptionLabel.text = "Today"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: fontSizeDescription)
        descriptionLabel.textColor = Theme.darkGray.color
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

