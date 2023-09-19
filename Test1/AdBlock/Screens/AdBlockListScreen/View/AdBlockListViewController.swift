//
//  AdBlockListViewController.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockListViewController: UIViewController {

    private let mainView = AdBlockListView()

    private var blockedSites: [Site] = [Site(url: "www.google.com"), Site(url: "www.pornhub.com")]
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
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
        mainView.listTableView.reloadData()
       }
    
}

extension AdBlockListViewController: UITableViewDelegate {
    
}

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
    //    cell.deleteButton.addTarget(self, action: #selector(websiteDelete(atIndex: index)), for: .touchUpInside)
        cell.configure(with: blockedSites[indexPath.row])
        cell.nameLabel.text = "Site_\(indexPath.row + 1)"
        return cell
    }
    
    
 //   @objc func websiteDelete(atIndex: Int) {
 //       blockedSites.remove(at: atIndex)
 //       mainView.listTableView.reloadData()
 //   }
   
}
