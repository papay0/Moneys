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
    
    private let marginCard = 10
    
    override init() {
        containerView = View()
        cardView = View()
        super.init()
        configure()
    }
    
    override func build() {
        super.build()
        setupSubviews()
        containerView.backgroundColor = .green
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        cardView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview().inset(marginCard)
        }
    }
    
    override func style() {
        cardView.layer.cornerRadius = 6
        cardView.layer.masksToBounds = true
        cardView.backgroundColor = .blue
    }
    
    // MARK: - Private
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(cardView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

