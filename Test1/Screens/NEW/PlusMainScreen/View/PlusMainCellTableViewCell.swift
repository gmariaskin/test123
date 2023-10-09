//
//  PlusMainCellTableViewCell.swift
//  Test1
//
//  Created by Gleb on 05.10.2023.
//

import UIKit

class PlusMainCellTableViewCell: UITableViewCell {
    
    
    //MARK: - Properties
    
    static let id = String(describing: PlusMainCellTableViewCell.self)
    
    private let container : UIView = {
        let obj = UIView()
        obj.layer.cornerRadius = 16
        return obj
    }()
    
    private let headerLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 17)
        obj.textAlignment = .left
        obj.textColor = .white
        return obj
    }()
    
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 15)
        obj.textAlignment = .left
        obj.textColor = .white
        return obj
    }()
    
    private let image : UIImageView = {
        let obj = UIImageView()
        return obj
    }()
    
    private let arrowButton : UIButton = {
        let obj = UIButton()
        obj.setImage(R.image.rightArrowButton(), for: .normal)
        return obj
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  

    
    //MARK: - Actions
    
    func configure(model: PlusMainCellModel) {
        self.backgroundColor = model.bgColor
        container.backgroundColor = model.containerColor
        headerLabel.text = model.header
        titleLabel.text = model.title
        
    }
    
    private func setup() {
        
        layer.cornerRadius = 16
        selectionStyle = .none
        
        addSubview(image)
        addSubview(container)
        container.addSubview(headerLabel)
        container.addSubview(titleLabel)
        container.addSubview(arrowButton)
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(9)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(7)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(container).offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerLabel.snp.leading)
            make.top.equalTo(headerLabel.snp.bottom).offset(2)
        }
    }
    
}
