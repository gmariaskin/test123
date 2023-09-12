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
    
    let countryImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    let nameLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        return obj
    }()
    
    let signalImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    let delayLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        return obj
    }()
    
    let checkButton: UIButton = {
        let obj = UIButton()
        return obj
    }()
    
    //MARK: - Actions
    
    func configure(with country: Country) {
        
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
        
        if country.premium == true {
            self.checkButton.setImage(UIImage(named: "locked"), for: .normal)
        } else {
            self.checkButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
        setupView()
    }
    
    private func setupView() {
        
        backgroundColor = .clear
        
        addSubview(countryImage)
        addSubview(nameLabel)
        addSubview(signalImage)
        addSubview(delayLabel)
        addSubview(checkButton)
        
        delayLabel.font = .systemFont(ofSize: 12)
        
        self.selectionStyle = .none
        
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
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
        
        checkButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = contentView.frame.height / 2
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        
        if sender.imageView?.image == UIImage(named: "checked")  {
            checkButton.setImage(UIImage(named: "unchecked"), for: .normal)
            checkButtonState = .unchecked
        } else if sender.imageView?.image == UIImage(named: "unchecked") {
            checkButton.setImage(UIImage(named: "checked"), for: .normal)
            checkButtonState = .checked
        } else {
            print ("🔒")
        }
    }
}