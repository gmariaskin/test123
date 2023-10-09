//
//  CustomCell.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let id = String(describing: CustomCell.self)
    
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .black
        obj.font = .systemFont(ofSize: 17, weight: .semibold)
        return obj
    }()
    
    private let testButton: UIButton = {
        let obj = UIButton()
        obj.setTitle("TEST BUTTON", for: .normal)
        return obj
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.backgroundColor = .gray
        backgroundColor = .red
        addSubview(titleLabel)
        contentView.addSubview(testButton)
        
        titleLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().offset(16)
        }
        
        testButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        testButton.addTarget(self, action: #selector(didTapTestButton), for: .touchUpInside)
    }
    
    @objc private func didTapTestButton() {
        print(titleLabel.text, "❇️")
    }
    
    func configure(with item: PersonModel) {
        titleLabel.text = item.name
    }
}
