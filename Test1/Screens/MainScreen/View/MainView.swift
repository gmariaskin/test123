//
//  MainView.swift
//  Test1
//
//  Created by DiOS on 04.09.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let button1: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .gray
        button1.setTitle("Go gray", for: .normal)
        return button1
    }()
    
    let button2: UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = .orange
        button2.setTitle("Go orange", for: .normal)
        return button2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init(state: MainScreenModel, frame: CGRect = .zero) {
        super.init(frame: frame)
        configure(with: state)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        addSubview(button1)
        addSubview(button2)
        
        button1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(100)
        }
        
        button2.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        
    }
    
    func configure(with state: MainScreenModel) {
        
        switch state {
        case .success:
            backgroundColor = .green
        case .fail:
            backgroundColor = .systemRed
        case .unknown:
            backgroundColor = .systemPink
        }
    }
}
