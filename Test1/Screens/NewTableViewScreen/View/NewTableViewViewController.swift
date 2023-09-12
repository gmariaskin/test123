//
//  NewTableViewViewController.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

class NewTableViewViewController: UIViewController {
    
    //MARK: - Properties
    var state: Premium
    var mainView: NewTableView
    
    //MARK: - Lifecycle
    init(state: Premium) {
        self.mainView = NewTableView()
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Actions
    
    private func setup() {
        
        mainView.tableView.isUserInteractionEnabled = true
        mainView.tableView.separatorStyle = .none
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(NewTableViewCell.self, forCellReuseIdentifier: NewTableViewCell.id)
        mainView.tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.id)
    }
}

//MARK: - UITableViewDelegate

extension NewTableViewViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource

extension NewTableViewViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return state == .notPremium ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if state == .notPremium {
            if section == 0 {
                return countries.filter { $0.premium == false }.count
            } else {
                return countries.filter { $0.premium == true }.count
            }
        } else {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.id, for: indexPath) as? NewTableViewCell else { return UITableViewCell() }
        let country: Country
        if state == .notPremium {
            if indexPath.section == 0 {
                let filteredCountries = countries.filter { $0.premium == false }
                country = filteredCountries[indexPath.row]
                cell.configure(with: country)
            } else {
                let filteredCountries = countries.filter { $0.premium == true }
                country = filteredCountries[indexPath.row]
                cell.configure(with: country)
            }
        } else {
            country = countries[indexPath.row]
            cell.configure(with: country)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = HeaderView()
        header.setTitle(with: section)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
