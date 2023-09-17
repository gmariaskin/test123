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
    
    let rulesTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    
    let stateLabel: UILabel = {
        let obj = UILabel()
        obj.textAlignment = .center
        obj.font = .systemFont(ofSize: 22, weight: .bold)
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
        
        rulesTableView.rowHeight = UITableView.automaticDimension
        rulesTableView.backgroundColor = .clear
     
        powerButton.imageView?.contentMode = .scaleAspectFit
        
        powerButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(63)
            make.top.equalToSuperview().inset(194)
            make.bottom.equalToSuperview().inset(429)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(58)
            make.top.equalToSuperview().inset(115)
            make.bottom.equalToSuperview().inset(709)
            make.centerX.equalToSuperview()
        }
        
        rulesTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(505)
            make.height.equalTo(236)
            make.bottom.equalToSuperview().inset(141)
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
