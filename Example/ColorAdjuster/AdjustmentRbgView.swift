//
//  AdjustmentRbgView.swift
//  ColorAdjuster
//
//  Created by Mai Ikeda on 2015/10/10.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit

class AdjustmentRbgView: UIView {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var rgbLabel: UILabel!
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    private var rValue: CGFloat { return CGFloat(rSlider.value) * 2 }
    private var gValue: CGFloat { return CGFloat(gSlider.value) * 2 }
    private var bValue: CGFloat { return CGFloat(bSlider.value) * 2 }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rSlider.value = 0.5
        gSlider.value = 0.5
        bSlider.value = 0.5
        
        updateBaseColor(UIColor(hex: 0xB7EAE7))
    }
    
    func updateBaseColor(color: UIColor) {
        baseView.backgroundColor = color
        updateRGBColor()
    }
    
    func updateRGBColor() {
        guard let color = baseView.backgroundColor else { return }
        
        let adjustmentColor = color.colorWithRGBComponent(red: rValue, green: gValue, blue: bValue)
        targetView.backgroundColor = adjustmentColor
        
        if let rbg = adjustmentColor?.colorRGB() {
            let r = Double(Int(rbg.red * 100)) / 100
            let g = Double(Int(rbg.green * 100)) / 100
            let b = Double(Int(rbg.blue * 100)) / 100
            rgbLabel.text = "R = \(r) : G = \(g) : B = \(b)"
        }
    }
}
