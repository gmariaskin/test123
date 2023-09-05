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
    
    //    FIXME: - лишнее место (промежуток 1 строка)
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
    //FIXME: - @objc func всегда делаем приватными
    //FIXME: - экшены выносим в extension нашего контроллера
    @objc func goToSecondVCGray() {
        //FIXME: - В следующей строке ты создаешь вьюшку и передаешь ее на следующий экран, лучше передавать не вью, а только стейты для нее и инитить вьюшку со стейтом (написал пример на SecondVC)
        
        /**
         let secondVC = SecondViewController(state: .gray)
         */
        let secondView = SecondView(state: .gray)
        let secondVC = SecondViewController(secondView: secondView, state: .gray)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goToSecondVCOrange() {
        let secondView = SecondView(state: .orange)
        let secondVC = SecondViewController(secondView: secondView, state: .orange)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    //    FIXME: - тут в @objc функциях у нас 2 раза повторяется код ⬆️
    /**
     let secondView = SecondView(state: .gray)
     let secondVC = SecondViewController(secondView: secondView, state: .gray)
     self.navigationController?.pushViewController(secondVC, animated: true)
     */
    //    FIXME: - Вынести код в отдельную функцию, которая будет принимать state и в @objc func вызывать эту функцию и передавать туда нужный стейт
        /**
         for example
         func showSecondScreen ... { ... }
         
         extension MainViewContoroller {
         @objc func goToSecondVCOrange() {
             showSecondScreen...
         }
         */
}

