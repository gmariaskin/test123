//
//  AdBlockListViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

protocol ProtocolDelegateList: AnyObject {
    func countSites(with numberOfSites: Int)
    func saveBlockedSites(with sites: [Site])
}

class AdBlockListViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView = AdBlockListView()
    
    private var blockedSites: [Site]
    
    weak var delegate: ProtocolDelegateList?
    
    //MARK: - Lifecycle
    
    init(blockedSites: [Site], delegate: ProtocolDelegateList? = nil) {
        self.blockedSites = blockedSites
        self.delegate = delegate
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
        
        mainView.listTableView.dataSource = self
        mainView.listTableView.delegate = self
        mainView.listTableView.register(ListCell.self, forCellReuseIdentifier: ListCell.id)
        mainView.listTableView.allowsSelection = false
        
        mainView.addButton.addTarget(self, action: #selector(addWebsite), for: .touchUpInside)
        
        self.title = "Block list"
        self.navigationController?.navigationBar.backIndicatorImage = R.image.leftArrow()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage =  R.image.leftArrow()
        self.navigationController?.navigationBar.tintColor = R.color.mainRed()
        
    }
    
    @objc func addWebsite() {
        
        let alert = UIAlertController(title: "Add to Block LIst", message: "Enter the Site Name of the page you want to block", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        let block = UIAlertAction(title: "Block", style: .default)  { [weak self] _ in
            
            if let text = alert.textFields?.first?.text {
                
                self?.handleEnteredText(text)
            }
        }
        alert.addAction(block)
        alert.addAction(action)
        alert.preferredAction = block
        alert.addTextField()
        
        self.present(alert, animated: true)
    }
    
    func handleEnteredText(_ text: String) {
        let newSite = Site(url: text)
        blockedSites.append(newSite)
        self.delegate?.countSites(with: blockedSites.count)
        self.delegate?.saveBlockedSites(with: blockedSites)
        mainView.listTableView.reloadData()
    }
    
}

//MARK: - UITableViewDelegate

extension AdBlockListViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource

extension AdBlockListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blockedSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.id, for: indexPath) as? ListCell else { return UITableViewCell() }
        let index = indexPath.row
        cell.configure(with: blockedSites[index])
        cell.deleteButton.addTarget(self, action: #selector(deleteSite(_:)), for: .touchUpInside)
        cell.nameLabel.text = "Site_\(indexPath.row + 1)"
        return cell
    }
    
    @objc func deleteSite(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Do you want to remove the site from the block list?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let delete = UIAlertAction(title: "Delete", style: .default) { [weak self] (action) in
            
            if let cell = sender.superview as? ListCell,
               let indexPath = self?.mainView.listTableView.indexPath(for: cell) {
                self?.blockedSites.remove(at: indexPath.row)
                self?.delegate?.countSites(with: self?.blockedSites.count ?? 1)
                self?.delegate?.saveBlockedSites(with: self?.blockedSites ?? [])
                self?.mainView.listTableView.reloadData()
            }
        }
        alert.addAction(cancel)
        alert.addAction(delete)
        alert.preferredAction = delete
        self.present(alert, animated: true)
    }
    
}


