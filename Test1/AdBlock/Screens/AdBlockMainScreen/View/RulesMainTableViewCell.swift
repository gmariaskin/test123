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
        obj.font = UIFont(name: "SF-Pro-Text-Bold", size: 17)
        return obj
    }()
    
    private let counterLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 1
        obj.font = UIFont(name: "SF-Pro-Text-Regular", size: 12)
        obj.adjustsFontSizeToFitWidth = true
        obj.textColor = UIColor(named: "accent")
        return obj
    }()
    
    private let descriptionLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 2
        obj.adjustsFontSizeToFitWidth = true
        obj.minimumScaleFactor = 0.5
        obj.font = UIFont(name: "SF-Pro-Text-Regular", size: 12)
        obj.textColor = .lightGray
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
        
        
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
        
        addSubview(headerLabel)
        addSubview(counterLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        
        descriptionLabel.font = UIFont(name: "SF-Pro-Text-Bold", size: 30)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(62)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalTo(headerLabel.snp.bottom).inset(2)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalTo(counterLabel.snp.bottom).inset(2)
            make.trailing.equalToSuperview().inset(124)
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


