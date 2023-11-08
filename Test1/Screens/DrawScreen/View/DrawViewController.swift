//
//  DrawViewController.swift
//  Test1
//
//  Created by DiOS on 08.11.2023.
//

import UIKit

class DrawViewController: UIViewController {
    let messageView = MessageView()
    let lineChartView = LineChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    private func initViewController() {
        view.backgroundColor = .white
        view.addSubview(messageView)
        view.addSubview(lineChartView)
        
        lineChartView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide.snp.verticalEdges).inset(250)
        }
    }
    
    func createChildVC() {
        let vc = ScreenMirrorViewController()
    }
}
