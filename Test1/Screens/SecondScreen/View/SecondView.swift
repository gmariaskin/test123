//
//  SecondView.swift
//  Test1
//
//  Created by Gleb on 05.09.2023.
//

import Foundation
import UIKit
//FIXME: - Когда импортируешь UIKit, Foundation - стираем, так как он уже находится внутри UIKit
import SnapKit
//FIXME: - SnapKit достаточно импортировать в 1 месте в проекте
class SecondView: UIView {
    
//   FIXME: - лишнее промежутки 
    
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
    
//    FIXME: - промежутки между функциями и проперти - 1 строка
    private func configure (with state: SecondScreenModel) {
        
        switch state {
        case .gray: backgroundColor = .gray
        case .orange: backgroundColor = .orange
        }
    }
    
    
}
