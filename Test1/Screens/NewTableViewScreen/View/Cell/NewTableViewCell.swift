//
//  NewTableViewCell.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let id = String(describing: NewTableViewCell.self)
    public var checkButtonState: CheckButtonState = .unchecked
   
    private let countryImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let nameLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        return obj
    }()
    
    private let signalImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let delayLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.font = .systemFont(ofSize: 12)
        return obj
    }()
    
    private let checkImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = contentView.frame.height / 2
    }
    
    
    private func setupView() {
        
        backgroundColor = .clear
        
        layoutSubviews()
        
        addSubview(countryImage)
        addSubview(nameLabel)
        addSubview(signalImage)
        addSubview(delayLabel)
        addSubview(checkImage)
        
        self.selectionStyle = .none
        
        countryImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(countryImage.snp.right).offset(20)
        }
        
        signalImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(70)
        }
        
        delayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(signalImage.snp.right).offset(5)
        }
        
        checkImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with country: Country, premiumStatus: Bool ) {
        
        let delay = country.delay
        self.delayLabel.text = "\(delay ?? 0) ms"
        self.countryImage.image = country.emoji
        self.nameLabel.text = country.countryName
        
        switch country.signal {
        case .medium: self.signalImage.image = UIImage(named: "mediumSignal")
        case .noSignal: self.signalImage.image = UIImage(named: "noSignal")
        case .strong: self.signalImage.image = UIImage(named: "strongSignal")
        case .weak: self.signalImage.image = UIImage(named: "weakSignal")
        }
        
        if country.premium == true && premiumStatus == false {
            self.checkImage.image = UIImage(named: "locked")
        } else {
            self.checkImage.image = UIImage(named: "unchecked")
        }
    }
    
    func configureState(with state: CheckButtonState ) {
        switch state {
        case .checked: self.checkImage.image = UIImage(named: "checked")
        case .locked: self.checkImage.image = UIImage(named: "locked")
        case .unchecked: self.checkImage.image = UIImage(named: "unchecked")
        }
    }
}
