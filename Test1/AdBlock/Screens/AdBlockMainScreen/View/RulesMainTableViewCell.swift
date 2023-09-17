//
//  RulesMainTableViewCell.swift
//  Test1
//
//  Created by Gleb on 17.09.2023.
//

import UIKit

class RulesMainTableViewCell: UITableViewCell {
    
    static let id = String(describing: RulesMainTableViewCell.self)

    private let headerLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.font = UIFont(name: "SFProText", size: 17)
        return obj
    }()
    
    private let counterLabel: UILabel = {
        let obj = UILabel()
        obj.font = UIFont(name: "SFProText", size: 13)
        obj.textColor = UIColor(named: "accent")
        return obj
    }()
    
    private let descriptionLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 2
        obj.font = UIFont(name: "SFProText", size: 12)
        obj.textColor = .gray
        return obj
    }()
    
    private let image: UIImageView = {
        let obj = UIImageView()
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
    
    private func setup(){
        
        addSubview(headerLabel)
        addSubview(counterLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(62)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalToSuperview().inset(32)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalToSuperview().inset(48)
        }
        
        image.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.top.bottom.equalToSuperview().inset(29)
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    func configure(with data: MainTableViewCell) {
        self.headerLabel.text = data.header
        self.counterLabel.text = data.counter
        self.descriptionLabel.text = data.description
        self.image.image = UIImage(named: data.image)
    }
    
    
    
}


