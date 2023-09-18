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
        obj.font = .systemFont(ofSize: 20, weight: .medium)
        return obj
    }()
    
    private let subLabel: UILabel = {
        let obj = UILabel()
        obj.text = "For using Adblock functionality, follow these steps:"
        obj.textAlignment = .center
        obj.numberOfLines = 2
        obj.font = .systemFont(ofSize: 17)
        return obj
    }()
    
    let goToButton: UIButton = {
        let obj = UIButton()
        obj.setTitle("Go To Settings", for: .normal)
        obj.titleLabel?.font = .systemFont(ofSize: 17)
        obj.titleLabel?.textColor = .white
        obj.backgroundColor = UIColor(named: "accent")
        obj.layer.cornerRadius = 27
        return obj
    }()
    
    private let feature1 = AdBlockCustomFeatureView(name: "1. Open Settings", image: "settings")
    private let feature2 = AdBlockCustomFeatureView(name: "2. Scroll and tap Safari", image: "safari")
    private let feature3 = AdBlockCustomFeatureView(name: "3. Then find Extensions", image: "appStore")
    private let feature4 = AdBlockCustomFeatureView(name: "4. Enable all our app blockers", image: "switch")
    
    
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
        addSubview(goToButton)
        addSubview(feature1)
        addSubview(feature2)
        addSubview(feature3)
        addSubview(feature4)
        
        feature1.backgroundColor = .gray
        feature2.backgroundColor = .blue
        feature3.backgroundColor = .brown
        feature4.backgroundColor = .red
        
        
        
        skipButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(56)
            //make.leading.trailing.equalToSuperview().inset(102)
            make.height.equalTo(25)
            make.width.equalTo(188)
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerLabel.snp.bottom).inset(-8)
            make.leading.trailing.equalToSuperview().inset(46)
            make.height.equalTo(44)
        }
        
        goToButton.snp.makeConstraints { make in
            make.width.equalTo(353)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().inset(96)
            make.centerX.equalToSuperview()
        }
        
        feature1.snp.makeConstraints { make in
            make.centerX.equalTo(subLabel.snp.centerX)
            make.width.equalTo(353)
            make.height.equalTo(32)
            make.top.equalTo(subLabel.snp.bottom).inset(-14)
        }
        
        feature2.snp.makeConstraints { make in
            make.centerX.equalTo(feature1.snp.centerX)
            make.width.equalTo(353)
            make.height.equalTo(32)
            make.top.equalTo(feature1.snp.bottom)
        }
        
        feature3.snp.makeConstraints { make in
            make.centerX.equalTo(feature1.snp.centerX)
            make.width.equalTo(353)
            make.height.equalTo(32)
            make.top.equalTo(feature2.snp.bottom)
        }
        
        feature4.snp.makeConstraints { make in
            make.centerX.equalTo(feature1.snp.centerX)
            make.width.equalTo(353)
            make.height.equalTo(32)
            make.top.equalTo(feature3.snp.bottom)
        }
    }
    
    
    
    
}
