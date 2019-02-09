//
//  CardView.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit

class StockCardView: View {
    
    private let containerView: View
    private let cardView: View
    private let topCardView: View
    private let middleCardView: View
    private let bottomCardView: View
    
    private let amountTodayLabel: UILabel
    private let pourcentageTodayLabel: UILabel
    private let stockNameLabel: UILabel
    private let todayDescriptionLabel: UILabel
    private let cumulatedDescriptionLabel: UILabel
    
    override init() {
        containerView = View()
        cardView = View()
        topCardView = View()
        middleCardView = View()
        bottomCardView = View()
        amountTodayLabel = UILabel()
        pourcentageTodayLabel = UILabel()
        stockNameLabel = UILabel()
        todayDescriptionLabel = UILabel()
        cumulatedDescriptionLabel = UILabel()
        super.init()
        configure()
        
        // TEST DATA
        todayDescriptionLabel.text = "Today"
        cumulatedDescriptionLabel.text = "Cumulated"
    }
    
    func set(stockName: String) {
        stockNameLabel.text = stockName
    }
    
    func set(isPositive: Bool) {
        if isPositive {
            topCardView.backgroundColor = Theme.positive.color
        } else {
            topCardView.backgroundColor = Theme.negative.color
        }
    }
    
    func set(amountToday: String) {
        amountTodayLabel.text = amountToday
    }
    
    func set(pourcentageToday: String) {
        pourcentageTodayLabel.text = pourcentageToday
    }
    
    override func build() {
        super.build()
        setupSubviews()
        setupLabels()
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(UISpecCard.heigh)
            make.top.equalToSuperview().inset(UISpecCard.marginTop)
            make.bottom.equalToSuperview().inset(UISpecCard.marginBottom)
            make.trailing.leading.equalToSuperview()
        }
        
        cardView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(UISpecCard.marginLeft)
            make.trailing.equalToSuperview().inset(UISpecCard.marginRight)
        }
        
        topCardView.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(UISpecCard.heightTop)
        }
        
        middleCardView.snp.makeConstraints { (make) in
            make.top.equalTo(topCardView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UISpecCard.heightMiddle)
        }
        
        bottomCardView.snp.makeConstraints { (make) in
            make.top.equalTo(middleCardView.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        amountTodayLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        stockNameLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(UISpecCard.description.margin)
        }
        
        todayDescriptionLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(UISpecCard.description.margin)
        }
        
        cumulatedDescriptionLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(UISpecCard.description.margin)
        }
    }
    
    override func style() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 6
        cardView.layer.borderWidth = 0.7
        cardView.layer.borderColor = Theme.borderCard.color.cgColor
        
        bottomCardView.backgroundColor = Theme.grayish.color.withAlphaComponent(0.6)
        bottomCardView.backgroundColor = Theme.grayish.color
    }
    
    // MARK: - Private
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        cardView.addSubview(topCardView)
        cardView.addSubview(middleCardView)
        cardView.addSubview(bottomCardView)
        topCardView.addSubview(amountTodayLabel)
        middleCardView.addSubview(todayDescriptionLabel)
        middleCardView.addSubview(cumulatedDescriptionLabel)
        bottomCardView.addSubview(stockNameLabel)
    }
    
    private func setupLabels() {
        amountTodayLabel.textAlignment = .center
        amountTodayLabel.font = UIFont.boldSystemFont(ofSize: UISpecCard.amount.fontSize)
        amountTodayLabel.textColor = Theme.white.color
        
        stockNameLabel.font = UIFont.boldSystemFont(ofSize: UISpecCard.stockName.fontSize)
        stockNameLabel.textColor = Theme.darkGray.color
    }
    
    private struct UISpecCard {
        static let marginTop = 10
        static let marginBottom = 10
        static let marginRight = 20
        static let marginLeft = 20
        static let heigh = 300
        static let heightTop = 150
        static let heightMiddle = 75
        
        struct amount {
            static let fontSize: CGFloat = 40
        }
        
        struct stockName {
            static let fontSize: CGFloat = 20
        }
        
        struct description {
            static let margin = 10
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

