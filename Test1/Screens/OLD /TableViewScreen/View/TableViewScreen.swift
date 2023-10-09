//
//  TableViewScreen.swift
//  Test1
//
//  Created by DiOS on 08.09.2023.
//

import UIKit

class TableViewScreen: UIViewController {
    private let mainView = MyTableView()
    private var modelData: [PersonModel] = []
    
    private var dataSource: UITableViewDiffableDataSource<Int, AnyHashable>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    private func initViewController() {
          
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.id)
        
        loadModelData()
//        configureDataSource()
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: mainView.tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.id, for: indexPath) as? CustomCell else { return UITableViewCell() }
            let item = self.modelData[indexPath.row]
            cell.configure(with: item)
            return cell
        })
        
        snapshot()
    }
    
    private func snapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, AnyHashable>()
        snapshot.appendSections([0])
        snapshot.appendItems(modelData)
        
        dataSource?.apply(snapshot)
    }
    
    func loadModelData() {
        modelData.removeAll()
        let person1 = PersonModel(name: "Dima")
        let person2 = PersonModel(name: "Kate")
        let person3 = PersonModel(name: "Test")

        modelData.append(contentsOf: [person1, person2, person3])
        mainView.tableView.reloadData()
    }
    
    private func deletePerson(index: Int) {
        modelData.remove(at: index)
        mainView.tableView.reloadData()
//        snapshot()
    }
}

//MARK: - UITableViewDelegate
extension TableViewScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deletePerson(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: - UITableViewDataSource
extension TableViewScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.id, for: indexPath) as? CustomCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            let item = modelData[indexPath.row]
            cell.configure(with: item)
            return cell
        default:
            let item = modelData[indexPath.row]
            cell.configure(with: item)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let textLabel = UILabel()
        textLabel.text = "Names"
        textLabel.textColor = .white
        textLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        let textLabel = UILabel()
        textLabel.text = "Footer"
        textLabel.textColor = .white
        textLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        view.backgroundColor = .blue
        return view
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Names"
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//            let deleteAction = UIContextualAction(style: .destructive,
//                                                  title: "Delete") { [weak self] _, _, complete in
////                tableView.deleteRows(at: [indexPath], with: .automatic)
//                complete(true)
//            }
//            deleteAction.backgroundColor = .red
//
//            return UISwipeActionsConfiguration(actions: [deleteAction])
//        }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete Action") { action, view, completion in
            print("Delete Action")
        }
        deleteAction.backgroundColor = .cyan
        //        let menu = UIMenu(title: "Main Menu", image: nil, identifier: .text, options: .displayInline, children: [editAction])
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let editAction = UIAction(title: "Edit", image: nil, identifier: .none, discoverabilityTitle: "+", state: .mixed) { action in
            print("EditAction")
        }
        let deleteAction = UIAction(title: "Delete", image: nil, identifier: .none, discoverabilityTitle: "+", attributes: .destructive, state: .off) { action in
            print("DeleteAction")
        }
        
        let menu = UIMenu(title: "Main Menu", image: nil, identifier: .text, options: .displayInline, children: [editAction, deleteAction])
        
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { elements in
            return menu
        }
        return config
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let firstPosition = modelData.remove(at: sourceIndexPath.row)
        modelData.insert(firstPosition, at: destinationIndexPath.row)
    }
}
