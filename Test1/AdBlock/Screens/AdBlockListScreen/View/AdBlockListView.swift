//
//  AdBlockListView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockListView: UIView {
    
    private let addButton : MainButton = {
        let obj = MainButton()
        obj.setTitle("Add", for: .normal)
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
        
        addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(70)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
