//
//  PlusMainView.swift
//  Test1
//
//  Created by Gleb on 05.10.2023.
//

import UIKit

class PlusMainView: UIView {

    //MARK: - Properties
    
    private let headerView : UIView = {
        let obj = UIView()
        obj.backgroundColor = R.color.headerRed()
        obj.layer.cornerRadius = 36
        return obj
    }()
    
    private let headerTitleLabel: UILabel = {
        let obj = UILabel()
        obj.text = "CONNECT YOUR DEVICE!"
        obj.textAlignment = .left
        obj.font = R.font.sfProTextBold(size: 17)
        obj.textColor = .white
        return obj
    }()
    
    
    private let headerSubLabel: UILabel = {
        let obj = UILabel()
        obj.text = "To establish a connection, ensure that both your phone and the desired device are linked to the same WiFi network"
        obj.textAlignment = .left
        obj.font = R.font.sfProTextRegular(size: 15)
        obj.textColor = .white
        obj.numberOfLines = 3
        return obj
    }()
    
    private let connectButton : UIButton = {
        let obj = UIButton()
        obj.setTitle("CONNECT", for: .normal)
        obj.setTitleColor(R.color.headerRed(), for: .normal)
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 14
        return obj
    }()
    
    
    let menuTableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.rowHeight = UITableView.automaticDimension
        obj.backgroundColor = .clear
        obj.separatorStyle = .none
        obj.isScrollEnabled = false
        return obj
    }()
    
    private let helpButton : UIButton = {
        let obj = UIButton()
        return obj
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    private func setup() {
        
        backgroundColor = .white
        
        addSubview(headerView)
        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(headerSubLabel)
        headerView.addSubview(connectButton)
        addSubview(menuTableView)
        addSubview(helpButton)
        
        headerView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(266)
        }
        
        headerTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(107)
            make.leading.equalToSuperview().offset(20)
        }
        
        headerSubLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(headerTitleLabel.snp.bottom).offset(3)
            make.leading.equalTo(headerTitleLabel)
            make.trailing.equalToSuperview().inset(63)
            
        }
        
        connectButton.snp.makeConstraints { make in
            make.top.equalTo(headerSubLabel.snp.bottom).offset(8)
            make.leading.equalTo(headerSubLabel)
            make.height.equalTo(50)
            make.width.equalTo(151)
        }
        
        menuTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.bottom.equalToSuperview().inset(74)
        }
    }
    
    
    
}
