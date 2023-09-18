//
//  MainButton.swift
//  Test1
//
//  Created by DiOS on 18.09.2023.
//

import UIKit

class MainButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = R.color.mainRed()
        layer.cornerRadius = 27
        titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)

        snp.makeConstraints {
            $0.height.equalTo(54)
        }
    }
}
