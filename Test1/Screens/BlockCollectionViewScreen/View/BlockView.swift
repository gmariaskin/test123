//
//  BlockView.swift
//  Test1
//
//  Created by Gleb on 14.09.2023.
//

import UIKit

class BlockView: UIView {
    
    //MARK: - Properties
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    let counterLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.textAlignment = .center
        obj.layer.cornerRadius = 10
        obj.clipsToBounds = true
        obj.backgroundColor = .lightGray
        obj.text = "0/8"
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
        
        addSubview(collectionView)
        addSubview(counterLabel)
        
        counterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
        }
        
        collectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(50)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
}
