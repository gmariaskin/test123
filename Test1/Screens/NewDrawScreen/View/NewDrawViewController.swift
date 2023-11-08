//
//  NewDrawViewController.swift
//  Test1
//
//  Created by Gleb on 08.11.2023.
//

import UIKit

class NewDrawViewController: UIViewController {
    
    let drawView = NewDrawView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    
    private func initVC() {
        view.backgroundColor = .gray
        view.addSubview(drawView)
        
        drawView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(25)
            make.verticalEdges.equalTo(view.safeAreaLayoutGuide.snp.verticalEdges).inset(250)
        }
        
    }
}
