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
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
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
        if !isPremium && item.premium == true {
            print("❌ Access denied")
        } else {
            print ("✅ Button Tapped")
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension NewCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
       return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
