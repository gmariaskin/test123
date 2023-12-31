//
//  NewTableViewViewController.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

protocol ProtocolDelegate: AnyObject {
//    var test: Bool { get set }
    func handler()
    func countryHandler(with item: Country, state: Bool)
}

class NewTableViewViewController: UIViewController {
    
    //MARK: - Properties
    var state: Premium
    var mainView: NewTableView
    var selectedRowIndex: Int = -1
    
    weak var delegate: ProtocolDelegate?

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
    
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - UITableViewDelegate

extension NewTableViewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.handler()
        delegate?.countryHandler(with: countries[indexPath.row], state: true)
        navigationController?.popViewController(animated: true)
//        handler?(countries[indexPath.row])
        
//        if indexPath.row != selectedRowIndex{
//            selectedRowIndex = indexPath.row
//            tableView.reloadData()
//        } else {
//            selectedRowIndex = -1
//            tableView.reloadData()
//        }
    }
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
       // cell.delegate = self
        var country: Country
        
        if state == .notPremium {
            if indexPath.section == 0 {
                let filteredCountries = countries.filter { $0.premium == false }
                country = filteredCountries[indexPath.row]
                cell.configure(with: country, premiumStatus: false)
                if indexPath.row == selectedRowIndex {
                    cell.configureState(with: .checked)
                } else {
                    cell.configureState(with: .unchecked)
                }
            } else {
                let filteredCountries = countries.filter { $0.premium == true }
                country = filteredCountries[indexPath.row]
                cell.configure(with: country, premiumStatus: false)
            }
        } else {
            country = countries[indexPath.row]
            country.premium = false
            cell.configure(with: country, premiumStatus: true)
            if indexPath.row == selectedRowIndex {
                cell.configureState(with: .checked)
            } else {
                cell.configureState(with: .unchecked)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = HeaderView()
        header.setTitle(with: section)
        return header
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}

//MARK: -  NewTableViewCellDelegate
//extension NewTableViewViewController: NewTableViewCellDelegate {
//    func didRemoveServer(cell: UITableViewCell) {
//        guard let newTableViewCell = cell as? NewTableViewCell else { return }
//        guard let index = mainView.tableView.indexPath(for: cell) else { return }
//        showAlert(title: countries[index.row].countryName!)
//        countries.remove(at: index.row)
//        mainView.tableView.reloadData()
//
//    }
//}
//
//
