//
//  StockCardView.swift
//  Moneys
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit

class StockCardView: View {
    
    private let containerView: View
    private let cardView: View
    
    @objc private let topCardView: View
    private let bottomCardView: View
    
    private let todayAmountView: View
    private let todayPourcentageView: View
    
    private let cumulatedAmountView: View
    private let cumulatedPourcentageView: View
    
    private let topCardStackView: UIStackView
    private let middleCardStackView: UIStackView
    private let todayCardStackView: UIStackView
    private let cumulatedCardStackView: UIStackView
    
    private let todayAmountLabel: UILabel
    private let todayPourcentageLabel: UILabel
    private let cumulatedAmountLabel: UILabel
    private let cumulatedPourcentageLabel: UILabel
    private let stockNameLabel: UILabel
    private let todayDescriptionLabel: UILabel
    private let cumulatedDescriptionLabel: UILabel
    
    override init() {
        containerView = View()
        cardView = View()
        
        topCardView = View()
        bottomCardView = View()
        
        todayAmountView = View()
        todayPourcentageView = View()
        cumulatedAmountView = View()
        cumulatedPourcentageView = View()
        
        topCardStackView = UIStackView()
        middleCardStackView = UIStackView()
        todayCardStackView = UIStackView()
        cumulatedCardStackView = UIStackView()
        
        todayAmountLabel = UILabel()
        todayPourcentageLabel = UILabel()
        cumulatedAmountLabel = UILabel()
        cumulatedPourcentageLabel = UILabel()
        stockNameLabel = UILabel()
        todayDescriptionLabel = UILabel()
        cumulatedDescriptionLabel = UILabel()
        super.init()
        configure()
    }
    
    func set(stockName: String) {
        stockNameLabel.text = stockName
    }
    
    func set(isTodayPositive: Bool, isCumulativePositive: Bool) {
        let gradientLayer = createGradientLayer(isTodayPositive: isTodayPositive,
                                                isCumulativePositive: isCumulativePositive)
        topCardView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: Int(UIScreen.main.bounds.width), height: UISpecCard.heightTop)
        topCardView.addSubview(topCardStackView)
    }
    
    func set(todayAmount: String, todayPourcentage: String, cumulatedAmount: String, cumulatedPourcentage: String) {
        todayAmountLabel.text = todayAmount
        todayPourcentageLabel.text = todayPourcentage
        cumulatedAmountLabel.text = cumulatedAmount
        cumulatedPourcentageLabel.text = cumulatedPourcentage
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
        
        middleCardStackView.snp.makeConstraints { (make) in
            make.top.equalTo(topCardView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UISpecCard.heightMiddle)
        }
        
        bottomCardView.snp.makeConstraints { (make) in
            make.top.equalTo(middleCardStackView.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        topCardStackView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        stockNameLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(UISpecCard.description.margin)
        }
        
        todayAmountLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        todayPourcentageLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        cumulatedAmountLabel.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        cumulatedPourcentageLabel.snp.makeConstraints { (make) in
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
        cardView.addSubview(middleCardStackView)
        cardView.addSubview(bottomCardView)
        topCardView.addSubview(topCardStackView)
        topCardStackView.addArrangedSubview(todayCardStackView)
        topCardStackView.addArrangedSubview(cumulatedCardStackView)
        todayCardStackView.addArrangedSubview(todayAmountView)
        todayCardStackView.addArrangedSubview(todayPourcentageView)
        cumulatedCardStackView.addArrangedSubview(cumulatedAmountView)
        cumulatedCardStackView.addArrangedSubview(cumulatedPourcentageView)
        middleCardStackView.addArrangedSubview(todayDescriptionLabel)
        middleCardStackView.addArrangedSubview(cumulatedDescriptionLabel)
        bottomCardView.addSubview(stockNameLabel)
        todayAmountView.addSubview(todayAmountLabel)
        todayPourcentageView.addSubview(todayPourcentageLabel)
        cumulatedAmountView.addSubview(cumulatedAmountLabel)
        cumulatedPourcentageView.addSubview(cumulatedPourcentageLabel)
    }
    
    private func setupLabels() {
        todayAmountLabel.textAlignment = .center
        todayAmountLabel.font = UIFont.boldSystemFont(ofSize: 50)
        todayAmountLabel.textColor = Theme.white.color
        
        cumulatedAmountLabel.textAlignment = .center
        cumulatedAmountLabel.font = UIFont.boldSystemFont(ofSize: 50)
        cumulatedAmountLabel.textColor = Theme.white.color
        
        todayPourcentageLabel.textAlignment = .center
        todayPourcentageLabel.textColor = Theme.white.color
        
        cumulatedPourcentageLabel.textAlignment = .center
        cumulatedPourcentageLabel.textColor = Theme.white.color
        
        stockNameLabel.font = UIFont.boldSystemFont(ofSize: UISpecCard.stockName.fontSize)
        stockNameLabel.textColor = Theme.darkGray.color
        
        todayDescriptionLabel.textAlignment = .center
        todayDescriptionLabel.textColor = .gray
        todayDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cumulatedDescriptionLabel.textAlignment = .center
        cumulatedDescriptionLabel.textColor = .gray
        cumulatedDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        todayDescriptionLabel.text = "Today"
        cumulatedDescriptionLabel.text = "Cumulated"
    }
    
    private func setupStackviews() {
        topCardStackView.axis = .horizontal
        topCardStackView.distribution = .fillEqually
        
        middleCardStackView.axis = .horizontal
        middleCardStackView.distribution = .fillEqually
        
        todayCardStackView.axis = .vertical
        todayCardStackView.distribution = .fillProportionally
        
        cumulatedCardStackView.axis = .vertical
        cumulatedCardStackView.distribution = .fillProportionally
    }
    
    private  func createGradientLayer(isTodayPositive: Bool, isCumulativePositive: Bool) -> CAGradientLayer {
        let startColor = isTodayPositive ? Theme.positive.color.cgColor : Theme.negative.color.cgColor
        let endColor = isCumulativePositive ? Theme.positive.color.cgColor : Theme.negative.color.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            startColor,
            endColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradientLayer
    }
    
    private struct UISpecCard {
        static let marginTop = 10
        static let marginBottom = 10
        static let marginRight = 20
        static let marginLeft = 20
        static let heigh = 270
        static let heightTop = 150
        static let heightMiddle = 60
        
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

