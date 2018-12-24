//
//  DesignableUIView.swift
//  BasicCoreGraphices_iOS
//
//  Created by Raj on 24/12/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

let numberOfItem = 8
let pi :CGFloat  = CGFloat(Double.pi)

@IBDesignable  class DesignableUIView: UIView {
 
    @IBInspectable var counter:Int = 5 {
        didSet{
            if counter <= numberOfItem{
        setNeedsDisplay()
            }
        }
    }
   @IBInspectable var outLineColor :UIColor = UIColor.blue
   @IBInspectable var counterColor :UIColor = UIColor.orange
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    */

    
    override func draw(_ rect: CGRect) {
     
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius:CGFloat = max(bounds.width, bounds.height)
        let archWidth:CGFloat = 76
        let startAngle :CGFloat = 3*pi/4
        let endAngle :CGFloat = pi/4
        
        drawArch(center:center, radius: radius, archWidth:archWidth, startAngle:startAngle, endAngle: endAngle)
        drawOuterLine(center: center, radius:radius, archWidth: archWidth, startAngle: startAngle, endAngle: endAngle)
        
    }
    
    private func drawArch(center:CGPoint, radius:CGFloat, archWidth:CGFloat,startAngle:CGFloat, endAngle:CGFloat){
        
        let path  = UIBezierPath(arcCenter:center, radius:radius/2-archWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise:true)
        path.lineWidth = archWidth
        counterColor.setStroke()
        path.stroke()
    }
    
    private func drawOuterLine(center:CGPoint, radius:CGFloat, archWidth:CGFloat,startAngle:CGFloat, endAngle:CGFloat){
        
        let angleDffrence:CGFloat = 2*pi - startAngle + endAngle
        let archLengthPerItem = angleDffrence/CGFloat(numberOfItem)
        let outlineEndAngle = archLengthPerItem  * CGFloat(counter) + startAngle
        
        let outerLinePath  = UIBezierPath(arcCenter:center, radius:radius/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise:true)
        
        outerLinePath.addArc(withCenter:center, radius:radius/2-archWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise:false)
        outerLinePath.close()
        outerLinePath.lineWidth = 5.0
        outLineColor.setStroke()
        outerLinePath.stroke()
    }
    
}
