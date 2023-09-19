//
//  AdBlockListView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockListView: UIView {
    
    let addButton : MainButton = {
        let obj = MainButton()
        obj.setTitle("Add", for: .normal)
        return obj
    }()
    
    let listTableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.backgroundColor = R.color.bg()
        obj.rowHeight = UITableView.automaticDimension
        obj.separatorStyle = .none
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
        
        backgroundColor = R.color.bg()
        
        addSubview(addButton)
        addSubview(listTableView)
        
        addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(70)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        listTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(addButton.snp.top).inset(-50)
            
        }
    }
}
