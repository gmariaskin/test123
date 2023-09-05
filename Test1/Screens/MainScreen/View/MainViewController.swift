//
//  ViewController.swift
//  Test1
//
//  Created by DiOS on 04.09.2023.
//

import UIKit

//    init
//    loadView
//    viewDidLoad
//    viewWillAppear
class MainViewController: UIViewController {
    
    private var mainView: MainView
    private var state: MainScreenModel
   
    
    //    MARK: - Function(s)
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
    
     @objc func goToSecondVCGray() {
         let secondView = SecondView(state: .gray)
         let secondVC = SecondViewController(secondView: secondView, state: .gray)
         self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goToSecondVCOrange() {
        let secondView = SecondView(state: .orange)
        let secondVC = SecondViewController(secondView: secondView, state: .orange)
        self.navigationController?.pushViewController(secondVC, animated: true)
   }
}

