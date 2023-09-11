//
//  NewCollectionView.swift
//  Test1
//
//  Created by Gleb on 10.09.2023.
//

import UIKit

class NewCollectionView: UIView {

    let newCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundColor = .gray
        
        addSubview(newCollectionView)
        
        newCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }

}
