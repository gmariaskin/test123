//
//  TabBarController.swift
//  Test1
//
//  Created by Gleb on 16.09.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    
    }
    
    private func setupTabs() {
        
        let callRec = self.createNav(with: "Call Rec", and: UIImage(named: "callRec")!, vc: CallRecViewController())
        let voiceRec = self.createNav(with: "Voice Rec", and: UIImage(named: "voiceRec")!, vc: VoiceRecViewController())
        let adBlock = self.createNav(with: "Ad Block", and: UIImage(named: "adBlock")!, vc: AdBlockMainViewController())
        let settings = self.createNav(with: "Settings", and: UIImage(named: "settings")!, vc: SettingsViewController())
        
        
        self.setViewControllers([callRec,voiceRec,adBlock,settings], animated: true)
        self.selectedViewController = adBlock
        
    }
    
    private func createNav(with title: String, and image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
        
        return nav
    }
    
}
