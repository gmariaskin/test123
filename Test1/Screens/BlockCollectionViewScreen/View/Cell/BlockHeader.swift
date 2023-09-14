//
//  BlockHeader.swift
//  Test1
//
//  Created by Gleb on 14.09.2023.
//

import UIKit

class BlockHeader: UICollectionReusableView {
        
    static let id = String(describing: BlockHeader.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 20)
        obj.textColor = .yellow
        obj.textAlignment = .center
        return obj
    }()
    
    private func setup(){
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with title: String) {
        self.titleLabel.text = title
    }
}
