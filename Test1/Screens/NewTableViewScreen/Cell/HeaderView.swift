//
//  HeaderView.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Properties

    static let id = String(describing: HeaderView.self)
    
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 20)
        obj.textColor = .yellow
        obj.textAlignment = .center
        return obj
    }()
    
    //MARK: - Actions
    
    func setTitle(with section: Int) {
        
        setup()
        
        if section == 0 {
            titleLabel.text = "Choose your country"
        } else {
            titleLabel.text = "Premium"
        }
    }
    
    private func setup() {
        
        addSubview(titleLabel)
        backgroundColor = .darkGray
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
        }
    }
}
