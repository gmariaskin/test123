//
//  NewTableView.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

class NewTableView: UIView {
    
//MARK: - Properties
    
    var tableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.rowHeight = 100
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

        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.backgroundColor = .darkGray
        
    }
}
