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

        self.viewControllers = [AdBlockMainViewController(), AdBlockRulesViewController(), AdBlockListViewController(),
        AdBlockGuideViewController()]
        
       
        self.navigationBar.backIndicatorImage = R.image.leftArrow()
        self.navigationBar.backIndicatorTransitionMaskImage =  R.image.leftArrow()
    }
    

   

}
