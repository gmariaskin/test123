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
        mainView.goToButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
    }

}

extension AdBlockGuideViewController {
    
    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
    
    @objc private func openSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
    }
}
