//
//  SecondView.swift
//  Test1
//
//  Created by Gleb on 05.09.2023.
//

import Foundation
import UIKit
import SnapKit

class SecondView: UIView {
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(state: SecondScreenModel, frame: CGRect = .zero) {
        super.init(frame: frame)
        configure(with: state)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure (with state: SecondScreenModel) {
        
        switch state {
        case .gray: backgroundColor = .gray
        case .orange: backgroundColor = .orange
        }
    }
    
    
}
