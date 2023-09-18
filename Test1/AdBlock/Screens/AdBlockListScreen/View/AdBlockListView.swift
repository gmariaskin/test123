//
//  AdBlockListView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockListView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundColor = R.color.bg()
    }
}
