//
//  AdBlockRulesViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

protocol ProtocolDelegateRules: AnyObject {
    func countRules()
}

class AdBlockRulesViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = AdBlockRulesView()
    
    weak var delegate: ProtocolDelegateRules?
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
        
        mainView.ruleTableView.dataSource = self
        mainView.ruleTableView.delegate = self
        mainView.ruleTableView.register(RulesCell.self, forCellReuseIdentifier: RulesCell.id)
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

//MARK: - UITableViewDelegate

extension AdBlockRulesViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource

extension AdBlockRulesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rulesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RulesCell.id, for: indexPath) as? RulesCell else { return UITableViewCell()}
        cell.configure(with: rulesArray[indexPath.row])
        return cell
    }
}

//MARK: - Model

private let rulesArray: [Rule] = [Rule(rule: "Block all", number: 1252, description: "All rules will be activated", image: R.image.blockAll()!),
                                  Rule(rule: "Remove ads", number: 333, description: "Blocking ads in any form", image: R.image.removeAds()!),
                                  Rule(rule: "Block trackers", number: 1000, description: "Tracking software blocking", image: R.image.blockTrackers()!),
                                  Rule(rule: "Block adult", number: 525, description: "Blocking ads of a sexual nature", image: R.image.blockAdults()!)]
