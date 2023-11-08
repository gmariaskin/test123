//
//  NewDrawView .swift
//  Test1
//
//  Created by Gleb on 08.11.2023.
//

import UIKit

class NewDrawView: UIView {
    
    var fillColor: UIColor = .red
    
    var shaperLayer: CAShapeLayer = {
        let obj = CAShapeLayer()
        obj.lineCap = .round
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = getPath()
        shaperLayer.path = path.cgPath
        shaperLayer.frame = layer.bounds
    }
    
    private func setup() {
        let path = getPath()
        shaperLayer.path = path.cgPath
        shaperLayer.frame = layer.bounds
        shaperLayer.fillColor = fillColor.cgColor
        layer.insertSublayer(shaperLayer, at: 0)
//        layer.addSublayer(shaperLayer)
        clipsToBounds = true
    }
    
    func getPath() -> UIBezierPath {
        let radius = 50.0
        let inset = 100.0
        let zero = 0.0
        let width = frame.width
        let height = frame.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: zero + inset, y: zero + inset))
       
        

        path.addArc(withCenter: CGPoint(x: inset, y: inset), radius: radius, startAngle: .pi / 2, endAngle: 12 * .pi / 6, clockwise: true)
       
        

        path.close()
        return path
    }
}
