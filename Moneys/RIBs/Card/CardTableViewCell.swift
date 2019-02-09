//
//  CardTableViewCell.swift
//  Money
//
//  Created by Arthur Papailhau on 09/02/2019.
//  Copyright © 2019 Arthur Papailhau. All rights reserved.
//

import UIKit
import SnapKit

class CardTableViewCell: UITableViewCell {

    private let containerView: View
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        containerView = CardView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildCell()
        setupCell()
    }

    // MARK: - Private
    
    private func buildCell() {
        addSubview(containerView)
    }
    
    private func setupCell() {
        containerView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
