//
//  ScreenMirrorViewController.swift
//  Test1
//
//  Created by Gleb on 09.10.2023.
//

import UIKit

class ScreenMirrorViewController: UIViewController {
    
    //MARK: - Properties
    
private let mainView = ScreenMirrorView()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    
    //MARK: - Actions
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
