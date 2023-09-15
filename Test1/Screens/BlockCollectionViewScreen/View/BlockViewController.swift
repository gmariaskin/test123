//
//  BlockViewController.swift
//  Test1
//
//  Created by Gleb on 14.09.2023.
//

import UIKit

class BlockViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = BlockView()
    private var selectedItems: Set<Int> = []
    private var blockModel: BlockModel
    
    //MARK: - Lifecycle
    
    init(blockModel: BlockModel) {
        self.blockModel = blockModel
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
    
    //MARK: - Functions
    
    private func initViewController() {
        
        mainView.collectionView.allowsMultipleSelection = true
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(BlockCell.self, forCellWithReuseIdentifier: BlockCell.id)
        mainView.collectionView.register(BlockHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: BlockHeader.id)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension BlockViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 5 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - UICollectionViewDataSource

extension BlockViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blockModel.contentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BlockCell.id, for: indexPath) as? BlockCell else { return UICollectionViewCell() }
        cell.configure(with: blockModel.contentArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BlockHeader.id, for: indexPath) as? BlockHeader else { return UICollectionReusableView() }
        header.configure(with: "What do you want to block?")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

//MARK: - UICollectionViewDelegate

extension BlockViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedColor = UIColor(red: 0.98, green: 0.75, blue: 0.25, alpha: 1.00)
        guard let item = collectionView.cellForItem(at: indexPath) else { return }
        item.contentView.backgroundColor = selectedColor
        selectedItems.insert(indexPath.row)
        mainView.counterLabel.text = "\(selectedItems.count)/8"
        print (selectedItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let item = collectionView.cellForItem(at: indexPath) else { return }
        item.contentView.backgroundColor = .darkGray
        selectedItems.remove(indexPath.row)
        mainView.counterLabel.text = "\(selectedItems.count)/8"
        print (selectedItems)
    }
}
