//
//  LineTaskView.swift
//  TSCalendar_Example
//
//  Created by TAE SU LEE on 2021/09/08.
//

import UIKit

class LineTaskView: UIView {
    var title: String?
    var taskColor: UIColor = .gray
    
    private let margin: CGFloat = 1
    private var hasDrawn: Bool = false
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if hasDrawn { return }
        hasDrawn = true
        
        let shapeLayer = CAShapeLayer()
        let strokeColor: UIColor = taskColor.withAlphaComponent(0.8)
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = rect.height
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: margin, y: rect.height/2),
                                CGPoint(x: rect.width-margin, y: rect.height/2)])
        
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
        
        if let title = title {
            let label = UILabel(frame: CGRect(x: margin+3, y: 0, width: rect.width-(margin+3), height: rect.height))
            label.text = title
            label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
            label.textColor = .black
            label.lineBreakMode = .byTruncatingTail
            addSubview(label)
        }
    }
}
