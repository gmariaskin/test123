//
//  CollectionViewController.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit



class CollectionViewController: UIViewController {
    private let mainView = MyCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    private func initViewController() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.id)
    }
}

//MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.id, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: (UIImage(systemName: "globe")?.withTintColor(.red, renderingMode: .alwaysOriginal))!)
        return cell
    }
}


