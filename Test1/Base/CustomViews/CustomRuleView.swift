//
//  CustomRuleView.swift
//  Test1
//
//  Created by Gleb on 18.09.2023.
//

import UIKit
import SnapKit

class CustomRuleView: UIView {
    
    private let headerLabel: UILabel = {
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
    
    private let image : UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let onSwitch : UISwitch = {
        let obj = UISwitch()
        obj.onTintColor = R.color.mainRed()
        return obj
    }()
    
    private lazy var hStack: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [headerLabel,counterLabel,descriptionLabel])
        obj.axis = .vertical
        obj.alignment = .leading
        obj.spacing = 2
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(rule: String, number: Int, description: String, image: UIImage) {
        super.init(frame: .zero)
        self.headerLabel.text = rule
        self.counterLabel.text = "\(number) Rules"
        self.descriptionLabel.text = description
        self.image.image = image
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundColor = R.color.mainBlack()
        
        
        self.layer.cornerRadius = 14
        
        self.snp.makeConstraints { make in
            make.height.equalTo(62)
        }
        
        addSubview(hStack)
        addSubview(image)
        addSubview(onSwitch)
        
        hStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2)
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.width.equalTo(182)
        }
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        onSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    
}

