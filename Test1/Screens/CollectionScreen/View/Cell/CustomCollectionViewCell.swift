//
//  CustomCollectionViewCell.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let id = String(describing: CustomCollectionViewCell.self)
    
    private let image: UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let testButton: UIButton = {
        let obj = UIButton()
        obj.setTitle("TEST BUTTON", for: .normal)
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
        contentView.backgroundColor = .green
        backgroundColor = .blue
        addSubview(testButton)
        contentView.addSubview(image)
        
        image.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        testButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        testButton.addTarget(self, action: #selector(didTapTestButton), for: .touchUpInside)
    }
    
    @objc private func didTapTestButton() {
        print("❇️")
    }
    
    func configure(with image: UIImage) {
        self.image.image = image
    }
}
