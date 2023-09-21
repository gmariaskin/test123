//
//  AdBlockMainView.swift
//  Test1
//
//  Created by Gleb on 15.09.2023.
//

import UIKit

class AdBlockMainView: UIView {
    
    //MARK: - Properties
    
    var blockOn: Bool = false
    var labelState: String = "TURNED OFF"
    
    let powerButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: "turnedOff"), for: .normal)
        return obj
    }()
    
    let rulesTableView: UITableView = {
        let obj = UITableView(frame: .zero, style: .insetGrouped)
        obj.rowHeight = UITableView.automaticDimension
        obj.backgroundColor = .clear
        obj.separatorStyle = .none
        return obj
    }()
    
    
    let stateLabel: UILabel = {
        let obj = UILabel()
        obj.textAlignment = .center
        obj.font = .systemFont(ofSize: 22, weight: .bold)
        obj.textColor = R.color.mainGray()
        obj.halfTextColorChange(fullText: "AD BLOCK IS TURNED OFF", changeText: "TURNED OFF")
        return obj
    }()
    
    
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    private func setup(){
        
        
        backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 1.00, alpha: 1.00)
        
        addSubview(powerButton)
        addSubview(rulesTableView)
        addSubview(stateLabel)
        addSubview(rulesTableView)
        
        powerButton.imageView?.contentMode = .scaleAspectFit
        stateLabel.adjustsFontSizeToFitWidth = true
        
        
        stateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(58)
            make.top.equalTo(safeAreaInsets.top).offset(115)
        }
        
        powerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(62)
            make.top.equalToSuperview().offset(194)
            make.height.equalTo(229)
            make.width.equalTo(268)
            
        }
        
          rulesTableView.snp.makeConstraints { make in
              make.centerX.equalToSuperview()
              make.leading.trailing.equalToSuperview().inset(20)
              make.height.equalTo(236)
              make.top.greaterThanOrEqualTo(powerButton.snp.bottom).offset(82)
          }
    }
    
    
    
}


extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        self.attributedText = attribute
    }
}

