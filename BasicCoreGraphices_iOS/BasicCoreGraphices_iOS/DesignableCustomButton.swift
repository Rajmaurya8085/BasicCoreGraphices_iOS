//
//  DesignableCustomButton.swift
//  BasicCoreGraphices_iOS
//
//  Created by Raj on 23/12/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit


@IBDesignable  class DesignableCustomButton: UIButton {

   @IBInspectable var fillColor:UIColor = UIColor.green
    @IBInspectable var isAdd:Bool = true
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
        let path  = UIBezierPath(ovalIn: rect)
       fillColor.setFill()
        path.fill()
        drawDesign()
    }
    
    func drawDesign(){
      horizontalLineDraw()
        if isAdd{
        verticalLineDraw()
            
        }
        
    }
    func horizontalLineDraw(){
        let pluseHeight :CGFloat = 3.0
        let pluseWidth :CGFloat =  min(bounds.height, bounds.width) * 0.6
        
        let plusePath  = UIBezierPath()
        plusePath.lineWidth = pluseHeight
        plusePath.move(to:CGPoint(x:bounds.width/2 - pluseWidth/2, y: bounds.height/2))
        plusePath.addLine(to:CGPoint(x:bounds.width/2 + pluseWidth/2, y:bounds.height/2))
        UIColor.white.setStroke()
        plusePath.stroke()
    }
    
    func verticalLineDraw(){
        let pluseHeight :CGFloat = 3.0
        let pluseWidth :CGFloat =  min(bounds.height, bounds.width) * 0.6
        
        let plusePath  = UIBezierPath()
        plusePath.lineWidth = pluseHeight
        plusePath.move(to:CGPoint(x:bounds.width/2, y: bounds.height/2 - pluseWidth/2))
        plusePath.addLine(to:CGPoint(x:bounds.width/2, y:bounds.height/2 + pluseWidth/2))
        UIColor.white.setStroke()
        plusePath.stroke()
    }
}
