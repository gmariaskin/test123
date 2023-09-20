//
//  RulesCell.swift
//  Test1
//
//  Created by Gleb on 20.09.2023.
//

import UIKit

class RulesCell: UITableViewCell {
    
    //MARK: - Properties
    static let id = String(describing: RulesCell.self)
    
    private let containerView : UIImageView = {
        let obj = UIImageView()
        obj.backgroundColor = R.color.darkGray()
        obj.layer.cornerRadius = 14
        return obj
    }()
    
    private let ruleImage : UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let ruleName: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 17)
        obj.textColor = .white
        return obj
    }()
    
    private let counterLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 12)
        obj.textColor = R.color.mainRed()
        return obj
    }()
    
    private let descriptionLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 12)
        obj.textColor = R.color.mainGray()
        return obj
    }()
    
    private let onSwitch : UISwitch = {
        let obj = UISwitch()
        return obj
    }()
    
    private lazy var vStack: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [ruleName, counterLabel, descriptionLabel])
        obj.axis = .vertical
        obj.spacing = 2
        obj.alignment = .leading
        return obj
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(ruleImage)
        containerView.addSubview(onSwitch)
        containerView.addSubview(vStack)
        
        containerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview().inset(4)
        }
         
        ruleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(ruleImage.snp.trailing).offset(16)
            make.verticalEdges.equalToSuperview().inset(5)
        }
        
        onSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with rule: Rule) {
        self.ruleName.text = rule.rule
        self.counterLabel.text = "\(rule.number ?? 0)" + " Rules"
        self.descriptionLabel.text = rule.description
        self.ruleImage.image = rule.image
    }
}
