//
//  NewCell.swift
//  Test1
//
//  Created by Gleb on 10.09.2023.
//

import UIKit

class NewCell: UICollectionViewCell {
    
    static let id = String(describing: NewCell.self)
    
    private var image: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    
    private let elementNameLabel: UILabel = {
        let obj = UILabel()
        return obj
    }()
    
    private let elementDescriptionLabel: UILabel = {
        let obj = UILabel()
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
        
        addSubview(image)
        addSubview(elementNameLabel)
        addSubview(elementDescriptionLabel)
        
        elementNameLabel.textColor = .black
        elementNameLabel.textAlignment = .left
        elementNameLabel.numberOfLines = 1
        
        elementDescriptionLabel.textColor = .gray
        elementDescriptionLabel.textAlignment = .left
        elementDescriptionLabel.numberOfLines = 1
        
        image.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.edges.equalToSuperview().multipliedBy(0.6)
        }
        
        elementNameLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(20)
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        elementDescriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    func configure(image: UIImage, name: String, description: String) {
        self.elementDescriptionLabel.text = description
        self.elementNameLabel.text = name
        self.image.image = image
        if self.elementDescriptionLabel.text == "Needs permissions" {
            self.elementDescriptionLabel.textColor = .red
        } else {
            self.elementDescriptionLabel.textColor = .black
        }
    }
}
