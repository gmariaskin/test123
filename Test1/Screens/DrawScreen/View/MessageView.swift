//
//  MessageView.swift
//  Test1
//
//  Created by DiOS on 08.11.2023.
//

import UIKit

class MessageView: UIView {
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
        let radius = 18.0
        let inset = 18.0
        let tailInset = 6.0
        let zero = 0.0
        let width = frame.width
        let height = frame.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: inset + tailInset, y: zero))
        path.addLine(to: CGPoint(x: width - inset, y: zero))
        
//        top-right angle
        path.addArc(withCenter: CGPoint(x: width - inset, y: inset), radius: radius, startAngle: .pi / 2, endAngle: 2 * .pi, clockwise: true)
        path.addLine(to: CGPoint(x: width, y: height - inset))
        
//        bottom-right angle
        path.addArc(withCenter: CGPoint(x: width - inset, y: height - inset), radius: radius, startAngle: 2 * .pi, endAngle: .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: inset + tailInset, y: height))
        
//        bottom-left angle
        path.addArc(withCenter: CGPoint(x: inset + tailInset, y: height - inset), radius: radius, startAngle: 3 * .pi / 2, endAngle: 5 * .pi / 6 - tailInset, clockwise: true)
        
//        tail bottom
        path.addArc(withCenter: CGPoint(x: zero, y: height - inset), radius: radius, startAngle: 11 * .pi / 6, endAngle: .pi / 2, clockwise: true)
        
//        tail top
        path.addQuadCurve(to: CGPoint(x: tailInset, y: height - inset), controlPoint: CGPoint(x: tailInset + 1, y: height))
        path.addLine(to: CGPoint(x: tailInset, y: inset))
        
//        top-left angle
        path.addArc(withCenter: CGPoint(x: inset + tailInset, y: inset), radius: radius, startAngle: .pi, endAngle: .pi / 2, clockwise: true)
        path.close()
        return path
    }
}
