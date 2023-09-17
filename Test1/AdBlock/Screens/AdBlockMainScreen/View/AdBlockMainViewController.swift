//
//  AdBlockMainViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockMainViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = AdBlockMainView()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
       
    
//MARK: - Actions
    
    @objc func powerButtonTapped() {
        
        if mainView.blockOn {
            mainView.powerButton.setImage(UIImage(named: "turnedOff"), for: .normal)
            mainView.blockOn = false
            mainView.stateLabel.halfTextColorChange(fullText: "AD BLOCK IS TURNED OFF", changeText: "TURNED OFF")
        } else {
            mainView.powerButton.setImage(UIImage(named: "turnedOn"), for: .normal)
            mainView.blockOn = true
            mainView.stateLabel.halfTextColorChange(fullText: "AD BLOCK IS TURNED ON", changeText: "TURNED ON")
        }
    }
    
    private func setup() {
        
        mainView.rulesTableView.dataSource = self
        mainView.rulesTableView.delegate = self
        mainView.rulesTableView.register(RulesMainTableViewCell.self, forCellReuseIdentifier: RulesMainTableViewCell.id)
        mainView.rulesTableView.backgroundColor = .gray

        
        mainView.powerButton.addTarget(self, action: #selector(powerButtonTapped), for: .touchUpInside)
    
        
    }
   

}

extension AdBlockMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: RulesMainTableViewCell.id, for: indexPath) as? RulesMainTableViewCell else { return UITableViewCell()}
        cell.configure(with: mainViewCells[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Rules"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension AdBlockMainViewController: UITableViewDelegate {
    
}
