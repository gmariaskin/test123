//
//  ViewController.swift
//  Test1
//
//  Created by DiOS on 04.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainView: MainView
    private var state: MainScreenModel
    
    init(state: MainScreenModel) {
        self.mainView = MainView(state: state)
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    private func initViewController() {
        mainView.button1.addTarget(self, action: #selector(goToSecondVCGray), for: .touchUpInside)
        mainView.button2.addTarget(self, action: #selector(goToSecondVCOrange), for: .touchUpInside)
    }
    
    private func goToNextScreen (with state: SecondScreenModel) {
        
        let secondVC = SecondViewController(state: state)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension MainViewController {
    
    @objc private func goToSecondVCGray() {
        
        goToNextScreen(with: .gray)
    }
    
    @objc private func goToSecondVCOrange() {
        
        goToNextScreen(with: .orange)
    }
}
