//
//  AdBlockMainViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockMainViewController: UIViewController {
    
    //MARK: - Model
    
    var mainViewCells: [MainTableViewCell] = [
        
        MainTableViewCell(header: "Block rules", counter: "0 rules", description: "Pesonalize the blocklist for a more comfortable experience", image: "block"),
        MainTableViewCell(header: "Block list", counter: "0 websites", description: "Manually enter a list of websites you wish to block", image: "list")
    ]
    
    //MARK: - Properties
   
    private let mainView = AdBlockMainView()
    private var blockedSitesArray: [Site] = []
    private var blockedRules: Int = 0
    
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
            presentGuide()
            
        } else {
            mainView.powerButton.setImage(UIImage(named: "turnedOn"), for: .normal)
            mainView.blockOn = true
            mainView.stateLabel.halfTextColorChange(fullText: "AD BLOCK IS TURNED ON", changeText: "TURNED ON")
            presentGuide()
        }
    }
    
    private func setup() {
        
        mainView.rulesTableView.dataSource = self
        mainView.rulesTableView.delegate = self
        mainView.rulesTableView.register(RulesMainTableViewCell.self, forCellReuseIdentifier: RulesMainTableViewCell.id)
        //mainView.rulesTableView.backgroundColor = .gray
        mainView.rulesTableView.isScrollEnabled = false
        
        
        mainView.powerButton.addTarget(self, action: #selector(powerButtonTapped), for: .touchUpInside)
        
        self.navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func presentGuide() {
        
        let guideVC = AdBlockGuideViewController()
        if let sheet = guideVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        guideVC.modalPresentationStyle = .pageSheet
        guideVC.modalTransitionStyle = .coverVertical
        present(guideVC, animated: true)
    }
    
    
}

//MARK: - Model

struct MainTableViewCell {
    let header: String
    var counter: String
    let description: String
    let image: String
}



//MARK: - UITableViewDataSource

extension AdBlockMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RulesMainTableViewCell.id, for: indexPath) as? RulesMainTableViewCell else { return UITableViewCell()}
        if indexPath.row == 0 {
            cell.configure(with: mainViewCells[indexPath.row])
        } else {
            cell.configure(with: mainViewCells[indexPath.row])
        }
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    
}

//MARK: - UITableViewDelegate

extension AdBlockMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = AdBlockRulesViewController()
            vc.hidesBottomBarWhenPushed = true
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            let vc = AdBlockListViewController(blockedSites: blockedSitesArray)
            vc.hidesBottomBarWhenPushed = true
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

//MARK: - ProtocolDelegateList

extension AdBlockMainViewController: ProtocolDelegateList {
    
    func saveBlockedSites(with sites: [Site]) {
        self.blockedSitesArray = sites
    }
    
    func countSites(with numberOfSites: Int) {
        mainViewCells[1].counter = "\(numberOfSites) websites"
        self.mainView.rulesTableView.reloadData()
    }
}

//MARK: - ProtocolDelegateRules

extension AdBlockMainViewController: ProtocolDelegateRules {
    
    func countRules(with total: Int) {
        self.mainViewCells[0].counter = "\(total) websites"
        self.mainView.rulesTableView.reloadData()
    }
    
    
}
