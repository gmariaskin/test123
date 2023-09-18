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
    
    private let imageContainerView: UIView = {
        let obj = UIView()
        obj.layer.cornerRadius = 16
        obj.backgroundColor = .systemRed
        return obj
    }()
    
    private let featureImage: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private lazy var hStackView: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [featureName, imageContainerView])
        obj.axis = .horizontal
        obj.alignment = .center
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(name: String, image: String, frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
        configure(with: name, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(hStackView)
        imageContainerView.addSubview(featureImage)
        
        hStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        featureImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints {
            $0.size.equalTo(32)
        }
    }
    
    func configure(with name: String, image: String) {
        self.featureImage.image = UIImage(named: image)
        self.featureName.text = name
    }
}
