//
//  AdBlockCustomFeatureView.swift
//  Test1
//
//  Created by Gleb on 18.09.2023.
//

import UIKit

class AdBlockCustomFeatureView: UIView {

    private let featureName: UILabel = {
        let obj = UILabel()
        obj.textColor = .black
        obj.font = .systemFont(ofSize: 17, weight: .medium)
        return obj
    }()
    
    private let featureImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(name: String, image: String) {
        self.featureImage.image = UIImage(named: image)
        self.featureName.text = name
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        addSubview(featureName)
        addSubview(featureImage)
        
        featureImage.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        featureName.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
        }
        
    }
    
}
