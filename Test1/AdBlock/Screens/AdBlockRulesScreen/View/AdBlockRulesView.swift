//
//  AdBlockRulesView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockRulesView: UIView {
  
 
    //MARK: - Properties
    
    var numberOfRules: Int = 0
    
    let ruleTableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.rowHeight = UITableView.automaticDimension
        obj.backgroundColor = .clear
        obj.separatorStyle = .none
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
        
        backgroundColor = R.color.bg()

        addSubview(ruleTableView)
        
        ruleTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(-50)
            
        }
        
  
        
    }
    
  
}
