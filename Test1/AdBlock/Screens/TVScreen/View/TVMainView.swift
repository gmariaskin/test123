//
//  TVMainView.swift
//  Test1
//
//  Created by Gleb on 02.10.2023.
//

import UIKit

class TVMainView: UIView {

    //MARK: - Properties
    
    private let topView : UIView = {
        let obj = UIView()
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
        
    }

}
