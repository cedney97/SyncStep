//
//  WavyBackgroundView.swift
//  SyncStep
//
//  Created by Cade Edney on 5/16/23.
//

import Foundation
import UIKit

class WavyBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        let p1 = CGPoint(x: 0,              y: height * 0.397)
        let p2 = CGPoint(x: width * 0.336,  y: height * 0.332)
        let p3 = CGPoint(x: width * 0.616,  y: height * 0.390)
        let p4 = CGPoint(x: width * 0.880,  y: height * 0.337)
        let p5 = CGPoint(x: width,          y: height * 0.371)
        
        let bottomRight = CGPoint(x: width, y: height)
        let bottomLeft =  CGPoint(x: 0,     y: height)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: p1)
        bezierPath.addLine(to: p2)
        bezierPath.addLine(to: p3)
        bezierPath.addLine(to: p4)
        bezierPath.addLine(to: p5)
        bezierPath.addLine(to: bottomRight)
        bezierPath.addLine(to: bottomLeft)
        bezierPath.addLine(to: p1)
        Colors.tropicalBlue.set()
        bezierPath.fill()
    }
}
