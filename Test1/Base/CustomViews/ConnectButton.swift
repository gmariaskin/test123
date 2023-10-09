//
//  ConnectButton.swift
//  Test1
//
//  Created by Gleb on 02.10.2023.
//

import UIKit

class ConnectButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setTitle("CONNECT", for: .normal)
        titleLabel?.font = R.font.sfProTextRegular(size: 17)
        layer.cornerRadius = 14
    }
}
