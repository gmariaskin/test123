//
//  ChartView.swift
//  Test1
//
//  Created by DiOS on 08.11.2023.
//

import UIKit

class LineChartView: UIView {
    let lineWidth: CGFloat = UIScreen.main.bounds.width * 0.01
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createMask()
        let context = UIGraphicsGetCurrentContext()
        let colors = [
          UIColor(red: 0.831, green: 0.659, blue: 1, alpha: 1).cgColor,
          UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        ]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0, 1]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0, y: frame.height)
        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: [CGGradientDrawingOptions(rawValue: 0)])
        
        let firstDot = CGPoint(x: lineWidth / 2, y: lineWidth / 2)
        let secondDot = CGPoint(x: frame.width - lineWidth / 2, y: frame.height * 0.8 )

        let path = UIBezierPath()
        path.move(to: firstDot)

        let firstDotControl = CGPoint(x: frame.width * 0.7, y: firstDot.y)
        let secondDotControl = CGPoint(x: frame.width * 0.3, y: secondDot.y)

        path.addCurve(to: secondDot, controlPoint1: firstDotControl, controlPoint2: secondDotControl)
        path.lineCapStyle = .round
        path.lineWidth = lineWidth

        let lineColor = UIColor.white
        lineColor.setStroke()

        path.stroke()
    }
    
    private func createMask() {

        let firstDot = CGPoint(x: 0, y: 0)
        let secondDot = CGPoint(x: frame.width, y: frame.height * 0.83 - lineWidth / 2)

        let path = UIBezierPath()
        path.move(to: firstDot)

        let firstDotControl = CGPoint(x: frame.width * 0.7 + lineWidth, y: firstDot.y)
        let secondDotControl = CGPoint(x: frame.width * 0.3 + lineWidth, y: secondDot.y)

        path.addCurve(to: secondDot, controlPoint1: firstDotControl, controlPoint2: secondDotControl)
        
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: firstDot)
        path.close()
        
        let view = UIView(frame: bounds)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        mask = view
    }
}
