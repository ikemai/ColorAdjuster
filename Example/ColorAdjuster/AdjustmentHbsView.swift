//
//  AdjustmentHbsView.swift
//  ColorAdjuster
//
//  Created by Mai Ikeda on 2015/10/09.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import ColorAdjuster

class AdjustmentHbsView: UIView {
    
    @IBOutlet weak var baseColorView: UIView!
    @IBOutlet weak var adjustmentColorView: UIView!
    
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var saturationSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    @IBOutlet weak var hbsLabel: UILabel!
    
    private var hueValue: CGFloat { return CGFloat(hueSlider.value) * 2 }
    private var saturationValue: CGFloat { return CGFloat(saturationSlider.value) * 2 }
    private var brightnessValue: CGFloat { return CGFloat(brightnessSlider.value) * 2 }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hueSlider.value = 0.5
        saturationSlider.value = 0.5
        brightnessSlider.value = 0.5
        
        updateBaseColor(UIColor(hex: 0xB7EAE7))
    }
    
    func updateBaseColor(color: UIColor) {
        baseColorView.backgroundColor = color
        updateHBSColor()
    }
    
    func updateHBSColor() {
        let adjustmentColor = baseColorView.backgroundColor?.colorWithHBSComponent(hue: hueValue, brightness: brightnessValue, saturation: saturationValue)
        adjustmentColorView.backgroundColor = adjustmentColor
        
        if let hbs = adjustmentColor?.colorHBS() {
            let h = Double(Int(hbs.hue * 100)) / 100
            let b = Double(Int(hbs.brightness * 100)) / 100
            let s = Double(Int(hbs.saturation * 100)) / 100
            hbsLabel.text = "H = \(h) : B = \(b) : S = \(s)"
        }
    }
}
