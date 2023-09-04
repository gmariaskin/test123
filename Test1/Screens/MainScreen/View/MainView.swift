//
//  MainView.swift
//  Test1
//
//  Created by DiOS on 04.09.2023.
//

import UIKit

class MainView: UIView {
    
    let button: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .blue
        return obj
    }()
    
    let view1 = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(state: MainScreenModel, frame: CGRect = .zero) {
        super.init(frame: frame)
        configure(with: state)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        addSubview(button)
        addSubview(view1)
        
//        snp constraints
        ///
    }
    
    func configure(with state: MainScreenModel) {
//        1
//        backgroundColor = state == .success ? .green : .systemRed

//        2
        switch state {
        case .success:
            backgroundColor = .green
        case .fail:
            backgroundColor = .systemRed
        case .unknown:
            backgroundColor = .systemPink
        }
//
////        3
//        if state {
//            backgroundColor = .green
//        } else {
//            backgroundColor = .systemRed
//        }
    }
}
