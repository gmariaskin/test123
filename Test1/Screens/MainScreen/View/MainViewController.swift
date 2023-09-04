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
    
//             cmd + control + space
    override func viewDidLoad() {
        super.viewDidLoad()
       initViewController()
    }
    
    private func initViewController() {
        if state == .success {
            print("✅", state)
        } else if state == .fail {
            print("❌", state)
        } else {
            print("unknown - ",state)
        }
    }
}

