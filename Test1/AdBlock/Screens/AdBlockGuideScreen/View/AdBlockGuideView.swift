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
        obj.textColor = .black
        obj.textAlignment = .center
        obj.font = .systemFont(ofSize: 20, weight: .medium)
        return obj
    }()
    
    private let subLabel: UILabel = {
        let obj = UILabel()
        obj.text = "For using Adblock functionality, follow these steps:"
        obj.textAlignment = .center
        obj.numberOfLines = 2
        obj.textColor = .black
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
    
    lazy var vStackView: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [
            feature1,
            feature2,
            feature3,
            feature4
        ])
        obj.axis = .vertical
        obj.distribution = .equalSpacing
        return obj
    }()
    
    private let feature1 = AdBlockCustomFeatureView(name: "1. Open Settings", image: "settings")
    private let feature2 = AdBlockCustomFeatureView(name: "2. Scroll and tap Safari", image: "safari")
    private let feature3 = AdBlockCustomFeatureView(name: "3. Then find Extensions", image: "appStore")
    private let feature4 = AdBlockCustomFeatureView(name: "4. Enable all our app blockers", image: "switch")
    
    private let dontShowAgainLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Don’t show guide again"
        obj.textColor = .black
        return obj
    }()
    
    private let switcher: UISwitch = {
        let obj = UISwitch()
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
        addSubview(goToButton)
        addSubview(vStackView)
        addSubview(dontShowAgainLabel)
        addSubview(switcher)
        
        skipButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(skipButton.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(46)
        }
        
        vStackView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        goToButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(54)
            make.top.equalTo(vStackView.snp.bottom).offset(28)
        }
        
        switcher.snp.makeConstraints {
            $0.top.equalTo(goToButton.snp.bottom).offset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-15)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        dontShowAgainLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalTo(switcher.snp.centerY)
        }
    }
    
    
    
    
}
