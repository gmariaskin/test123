//
//  PlusMainScreenViewController.swift
//  Test1
//
//  Created by Gleb on 05.10.2023.
//

import UIKit

class PlusMainScreenViewController: UIViewController {
    
    //MARK: - Properties
    private let mainView = PlusMainView()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    //MARK: - Actions
    
    private func setup() {
        
        mainView.menuTableView.dataSource = self
        mainView.menuTableView.delegate = self
        mainView.menuTableView.register(PlusMainCellTableViewCell.self, forCellReuseIdentifier: PlusMainCellTableViewCell.id)
        
        self.navigationItem.title = "Screen+"
        self.navigationItem.titleView?.tintColor = .white
        self.navigationItem.titleView?.isHidden = false
    }
    
    
    //MARK: - Model
    
   let cellModelArray: [PlusMainCellModel] = [
    PlusMainCellModel(bgColor: R.color.cell1Bg()!, containerColor: R.color.cell1Cont()!, header: "Screen Cast", title: "Stream your phone screen\nto your TV in real-time"),
    PlusMainCellModel(bgColor: R.color.cell2Bg()!, containerColor: R.color.cell2Cont()!, header: "Video", title: "Display your video content\non your TV"),
    PlusMainCellModel(bgColor: R.color.cell3Bg()!, containerColor: R.color.cell3Cont()!, header: "Photo", title: "Stream your photos from\nyour phone to TV")
   ]
  
    
}






extension PlusMainScreenViewController: UITableViewDelegate {
    
}


extension PlusMainScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlusMainCellTableViewCell.id, for: indexPath) as? PlusMainCellTableViewCell else { return UITableViewCell()}
        cell.configure(model: cellModelArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


