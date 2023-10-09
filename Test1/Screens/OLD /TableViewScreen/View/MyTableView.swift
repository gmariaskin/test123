//
//  MyTableView.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit

class MyTableView: UIView {
    
    let tableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.rowHeight = UITableView.automaticDimension
        obj.separatorColor = .white
//        obj.isEditing = true
//        obj.allowsMultipleSelectionDuringEditing = true
//        obj.allowsFocusDuringEditing = true
//        obj.allowsSelectionDuringEditing = true
        return obj
    }()
    
    let scrollView: UIScrollView = {
        let obj = UIScrollView()
        return obj
    }()
    
    let stackView: UIStackView = {
        let obj = UIStackView()
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
