//
//  NewCollectionViewController.swift
//  Test1
//
//  Created by Gleb on 10.09.2023.
//

import UIKit

class NewCollectionViewController: UIViewController {
    
    private let mainView = NewCollectionView()
    var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
        super.init(nibName: nil, bundle: nil)
        view = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    private func initViewController() {
        mainView.newCollectionView.delegate = self
        mainView.newCollectionView.dataSource = self
        mainView.newCollectionView.register(NewCell.self, forCellWithReuseIdentifier: NewCell.id)
    }
}

//MARK: - UICollectionViewDataSource

extension NewCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionModelArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCell.id, for: indexPath) as? NewCell else { return UICollectionViewCell() }
        
        var item = collectionModelArray![indexPath.row]
        
        switch isPremium {
        case true :
            cell.configure(with: item)
        case false:
            if item.premium {
                item.description! = "Needs permissions"
                cell.configure(with: item)
            } else {
                cell.configure(with: item)
            }
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension NewCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = collectionModelArray![indexPath.row]
        if item.premium == false {
            print("Access denied")
        } else {
            print ("Button Tapped")
        }
    }
}
