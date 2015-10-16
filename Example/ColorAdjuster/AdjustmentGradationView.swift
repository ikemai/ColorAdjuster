//
//  AdjustmentGradationView.swift
//  ColorAdjuster
//
//  Created by Mai Ikeda on 2015/10/09.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import ColorAdjuster

class AdjustmentGradationView: UIView {
    
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var colorsLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    
    private var colors: [CGColor] = []
    private var locations: [CGFloat] = [0]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let defautColor = UIColor(hex: 0xB7EAE7)
        colors.append(defautColor.colorWithAlphaComponent(0).CGColor)
        layoutIfNeeded()
        updateGradation(defautColor)
    }
    
    func updateGradation(color: UIColor) {
        colors.append(color.CGColor)
        locations = [0]
        for var i = colors.count; i > 1; i-- {
            let location = CGFloat(100 / i) / 50
            locations.append(location)
        }
        targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, locations: locations)
        colorsLabel.text = "Colors = \(colors)"
        locationsLabel.text = "Locations = \(locations)"
    }
}
