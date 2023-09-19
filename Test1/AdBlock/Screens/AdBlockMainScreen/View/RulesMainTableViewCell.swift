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
        obj.font = .systemFont(ofSize: 17)
        return obj
    }()
    
    private let counterLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 1
        obj.font = .systemFont(ofSize: 12)
        //obj.adjustsFontSizeToFitWidth = true
        obj.textColor = R.color.mainRed()
        obj.text = "0 Rules"
        return obj
    }()
    
    private let descriptionLabel: UILabel = {
        let obj = UILabel()
        obj.numberOfLines = 2
        obj.adjustsFontSizeToFitWidth = true
        //obj.minimumScaleFactor = 0.8
        obj.font = .systemFont(ofSize: 12)
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
        
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(62)
            make.height.equalTo(22)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalTo(headerLabel.snp.bottom).inset(2)
            make.height.equalTo(14)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(62)
            make.top.equalTo(counterLabel.snp.bottom).inset(2)
            make.trailing.equalToSuperview().inset(124)
            make.height.equalTo(32)
        }
        
        image.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.top.bottom.equalToSuperview().inset(29)
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    func configure(with data: MainTableViewCell, and count: String) {
        self.headerLabel.text = data.header
        self.descriptionLabel.text = data.description
        self.counterLabel.text = data.counter
        self.image.image = UIImage(named: data.image)
    }
    
    
    
}


