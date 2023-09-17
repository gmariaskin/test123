//
//  AdBlockNavigationController.swift
//  Test1
//
//  Created by Gleb on 16.09.2023.
//

import UIKit

class AdBlockNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers = [AdBlockMainViewController(), AdBlockRulesViewController(), AdBlockListViewController()]
    }
    

   

}
