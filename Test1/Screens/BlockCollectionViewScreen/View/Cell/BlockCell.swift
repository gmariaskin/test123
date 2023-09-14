//
//  BlockCell.swift
//  Test1
//
//  Created by Gleb on 14.09.2023.
//

import UIKit

class BlockCell: UICollectionViewCell {
    
    //MARK: - Properties
    
   static let id = String(describing: BlockCell.self)
    
    private let image: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let label: UILabel = {
        let obj = UILabel()
        obj.textAlignment = .center
        obj.numberOfLines = 1
        obj.font = UIFont(name: "SF-Pro", size: 10)
        obj.textColor = .white
        return obj
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    private func setup() {
        
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 20
        
        addSubview(image)
        addSubview(label)
        
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.width.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(20)
        }
    }
    
    func configure(with content: Content) {
        self.image.image = UIImage(named: content.imageName)
        self.label.text = content.name
    }
}
