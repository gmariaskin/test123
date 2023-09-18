//
//  AdBlockRulesView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockRulesView: UIView {
  
    private let rule1 = CustomRuleView(rule: "Block all", number: 1252, description: "All rules will be activated", image: R.image.blockAll()!)
    private let rule2 = CustomRuleView(rule: "Remove ads", number: 333, description: "Blocking ads in any form", image: R.image.removeAds()!)
    private let rule3 = CustomRuleView(rule: "Block trackers", number: 1000, description: "Tracking software blocking", image: R.image.blockTrackers()!)
    private let rule4 = CustomRuleView(rule: "Block adult", number: 525, description: "Blocking ads of a sexual nature", image: R.image.blockAdults()!)
    
    lazy var vStackView: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [
            rule1,
            rule2,
            rule3,
            rule4
        ])
        obj.axis = .vertical
        obj.distribution = .equalSpacing
        obj.spacing = 8
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
        
        backgroundColor = R.color.bg()

        addSubview(vStackView)
        
        vStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(113)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
    }
}
