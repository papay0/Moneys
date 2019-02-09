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
    private let cumulatedCardView: View
    
    private let topCardView: View
    private let middleCardView: View // TODO: Make it a stack view
    private let bottomCardView: View
    
    private let todayAmountView: View
    private let todayPourcentageView: View
    
    private let topCardStackView: UIStackView
    private let todayCardStackView: UIStackView
    
    private let amountTodayLabel: UILabel
    private let pourcentageTodayLabel: UILabel
    private let stockNameLabel: UILabel
    private let todayDescriptionLabel: UILabel
    private let cumulatedDescriptionLabel: UILabel
    
    override init() {
        containerView = View()
        cardView = View()
        cumulatedCardView = View()
        
        topCardView = View() // To make a gradient
        middleCardView = View()
        bottomCardView = View()
        
        todayAmountView = View()
        todayPourcentageView = View()
        
        topCardStackView = UIStackView()
        todayCardStackView = UIStackView()
        
        amountTodayLabel = UILabel()
        pourcentageTodayLabel = UILabel()
        stockNameLabel = UILabel()
        todayDescriptionLabel = UILabel()
        cumulatedDescriptionLabel = UILabel()
        super.init()
        configure()
        
        // TEST DATA
        topCardView.backgroundColor = .orange
        todayDescriptionLabel.text = "Today"
        cumulatedDescriptionLabel.text = "Cumulated"
        pourcentageTodayLabel.text = "+7%"
        
        cumulatedCardView.backgroundColor = .yellow
        
        // todayAmountView.backgroundColor = .blue
        // todayPourcentageView.backgroundColor = .purple
    }
    
    func set(stockName: String) {
        stockNameLabel.text = stockName
    }
    
    func set(isPositive: Bool) {
//        if isPositive {
//            topCardStackView.backgroundColor = Theme.positive.color
//        } else {
//            topCardStackView.backgroundColor = Theme.negative.color
//        }
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
        setupStackviews()
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
        
        topCardStackView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
//        amountTodayLabel.snp.makeConstraints { (make) in
//            make.top.bottom.leading.trailing.equalToSuperview()
//        }
        
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
        
        amountTodayLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        pourcentageTodayLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
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
        topCardView.addSubview(topCardStackView)
        topCardStackView.addArrangedSubview(todayCardStackView)
        topCardStackView.addArrangedSubview(cumulatedCardView)
        todayCardStackView.addArrangedSubview(todayAmountView)
        todayCardStackView.addArrangedSubview(todayPourcentageView)
        middleCardView.addSubview(todayDescriptionLabel)
        middleCardView.addSubview(cumulatedDescriptionLabel)
        bottomCardView.addSubview(stockNameLabel)
        todayAmountView.addSubview(amountTodayLabel)
        todayPourcentageView.addSubview(pourcentageTodayLabel)
    }
    
    private func setupLabels() {
        amountTodayLabel.textAlignment = .center
        amountTodayLabel.font = UIFont.boldSystemFont(ofSize: 50)
        amountTodayLabel.textColor = Theme.white.color
        
        pourcentageTodayLabel.textAlignment = .center
        pourcentageTodayLabel.textColor = Theme.white.color
        
        stockNameLabel.font = UIFont.boldSystemFont(ofSize: UISpecCard.stockName.fontSize)
        stockNameLabel.textColor = Theme.darkGray.color
    }
    
    private func setupStackviews() {
        topCardStackView.axis = .horizontal
        topCardStackView.distribution = .fillEqually
        
        todayCardStackView.axis = .vertical
        todayCardStackView.distribution = .fillProportionally
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

