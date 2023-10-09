//
//  SecondViewController.swift
//  Test1
//
//  Created by Gleb on 05.09.2023.
//

import UIKit

class SecondViewController: UIViewController {

    private var secondView: SecondView
    private var state: SecondScreenModel
    
    //MARK: - Function(s)
    init(state: SecondScreenModel) {
        self.secondView = SecondView(state: state)
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = secondView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
