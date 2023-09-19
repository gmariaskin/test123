//
//  AdBlockListViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockListViewController: UIViewController {

    private let mainView = AdBlockListView()

    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        self.title = "Block list"
        self.navigationController?.navigationBar.backIndicatorImage = R.image.leftArrow()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage =  R.image.leftArrow()
        self.navigationController?.navigationBar.tintColor = R.color.mainRed()

       
     
    }

}
