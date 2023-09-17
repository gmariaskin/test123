//
//  AdBlockGuideView.swift
//  Test1
//
//  Created by Gleb on 17.09.2023.
//

import UIKit

class AdBlockGuideView: UIView {
    
     let skipButton: UIButton = {
        let obj = UIButton()
        obj.setTitle("Skip", for: .normal)
         obj.setTitleColor(UIColor(named: "accent"), for: .normal)
        
        return obj
    }()
    
    private let headerLabel: UILabel = {
        let obj = UILabel()
        obj.text = "How To Use AdBlock"
        obj.textAlignment = .center
        obj.font = UIFont(name: "SFProText", size: 20)
        return obj
    }()
    
    private let subLabel: UILabel = {
        let obj = UILabel()
        obj.text = "For using Adblock functionality, follow these steps:"
        obj.textAlignment = .center
        obj.numberOfLines = 2
        obj.font = UIFont(name: "SFProText", size: 17)
        return obj
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundColor = .white
        
        addSubview(skipButton)
        addSubview(headerLabel)
        addSubview(subLabel)
        
        skipButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(56)
            make.leading.trailing.equalToSuperview().inset(102)
            make.height.equalTo(25)
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerLabel.snp.bottom).inset(8)
            make.leading.trailing.equalToSuperview().inset(46)
        }
    }
    
  
}
