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
    
    init(secondView: SecondView, state: SecondScreenModel) {
        self.secondView = secondView
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
