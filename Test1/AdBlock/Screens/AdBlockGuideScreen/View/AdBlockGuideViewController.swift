//
//  AdBlockGuideViewController.swift
//  Test1
//
//  Created by Gleb on 17.09.2023.
//

import UIKit

class AdBlockGuideViewController: UIViewController {
    
    private let mainView = AdBlockGuideView()
    

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        mainView.skipButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
}
