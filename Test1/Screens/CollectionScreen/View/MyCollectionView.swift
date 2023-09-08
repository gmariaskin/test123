//
//  MyCollectionView.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit

class MyCollectionView: UIView {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let size = floor(UIScreen.main.bounds.width - (40 + 8 * 3)) / 4
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        layout.sectionInset = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        
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
        backgroundColor = .white
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
}
