//
//  ListCell.swift
//  Test1
//
//  Created by Gleb on 19.09.2023.
//

import UIKit

class ListCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let id = String(describing: ListCell.self)
    
    private let containerView: UIView = {
        let obj = UIView()
        return obj
    }()
    
     let nameLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 17)
        obj.textColor = .white
        return obj
    }()
    
    private let urlLabel: UILabel = {
        let obj = UILabel()
        obj.font = .systemFont(ofSize: 12)
        obj.textColor = R.color.mainGray()
        return obj
    }()
    
    lazy var vStack: UIStackView = {
        let obj = UIStackView(arrangedSubviews: [nameLabel, urlLabel])
        obj.axis = .vertical
        obj.spacing = 2
        obj.alignment = .leading
        return obj
    }()
    
     let deleteButton : UIButton = {
        let obj = UIButton()
         obj.setImage(R.image.trash(), for: .normal)
        return obj
    }()
    
    private let globeImage : UIImageView = {
        let obj = UIImageView()
        obj.image = R.image.globe()
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
    
    func configure(with site: Site) {
        self.urlLabel.text = site.url
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        contentView.backgroundColor = R.color.darkGray()
        contentView.layer.cornerRadius = 17
    }
    
    private func setup() {
        
        backgroundColor = R.color.bg()
        
        layoutSubviews()
        contentView.addSubview(containerView)
        addSubview(vStack)
        addSubview(deleteButton)
        addSubview(globeImage)
        
        self.selectionStyle = .none
        
        containerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(2)
            $0.verticalEdges.equalToSuperview().inset(2)
        }
         
        globeImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(globeImage.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(18.6)
        }
    }
}
