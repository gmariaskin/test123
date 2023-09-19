//
//  AdBlockRulesViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

protocol RulesCounterDelegate: AnyObject {
    func countRules(with totalRules: Int)
}

class AdBlockRulesViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = AdBlockRulesView()
    weak var delegate: RulesCounterDelegate?

    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        self.title = "Block rules"
        self.navigationController?.navigationBar.backIndicatorImage = R.image.leftArrow()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage =  R.image.leftArrow()
        self.navigationController?.navigationBar.tintColor = R.color.mainRed()
        
    }
    
}

