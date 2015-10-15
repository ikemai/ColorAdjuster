//
//  ColorAdjuster.swift
//  ColorAdjuster
//
//  Created by Mai Ikeda on 2015/10/15.
//  Copyright © 2015年 mai_ikeda. All rights reserved.
//

import UIKit

public class ColorAdjuster: UIView {
    
    static let sharedInstance = ColorAdjuster()
    public var gradientLayer: CALayer?
    
    /**
    Value of HBS
    */
    public struct HBSProperties {
        public var hue: CGFloat = 0
        public var brightness: CGFloat = 0
        public var saturation: CGFloat = 0
        public var alpha: CGFloat = 1
    }
    
    /**
    Value of RGB
    */
    public struct RGBProperties {
        public var r: CGFloat = 0
        public var g: CGFloat = 0
        public var b: CGFloat = 0
        public var alpha: CGFloat = 1
    }
}

extension UIColor {
    
    /**
    Appoint it in hexadecimal and create UIColor.
    */
    public convenience init(hex: Int, alpha: CGFloat = 1) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255
        let g = CGFloat((hex & 0x00FF00) >> 8 ) / 255
        let b = CGFloat((hex & 0x0000FF) >> 0 ) / 255
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

// MARK: - Change a value of HBS
extension UIColor {
    
    /**
    Adjustment color by HBS
    - parameter hue, brightness, saturation = 0~1
    */
    public func colorWithHBSComponent(hue hue: CGFloat, brightness: CGFloat, saturation: CGFloat) -> UIColor? {
        if let hbs = colorHBS() {
            return UIColor(hue: (hbs.hue * hue), saturation: (hbs.saturation * saturation), brightness: (hbs.brightness * brightness), alpha: hbs.alpha)
        }
        return nil
    }
    
    /**
    Get color HBS
    */
    public func colorHBS() -> ColorAdjuster.HBSProperties? {
        var hbs = ColorAdjuster.HBSProperties()
        let converted = getHue(&hbs.hue, saturation: &hbs.saturation, brightness: &hbs.brightness, alpha: &hbs.alpha)
        if converted {
            return hbs
        }
        return nil
    }
}

// MARK: - Change a value of RGB
extension UIColor {
    /**
    Adjustment color by RGB
    - parameter hue, brightness, saturation = 0~1
    */
    public func colorWithRGBComponent(r r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor? {
        if let rgb = colorRGB() {
            return UIColor(red: (rgb.r * r), green: (rgb.g * g), blue: (rgb.b * b), alpha: rgb.alpha)
        }
        return nil
    }
    
    /**
    Get color RGB
    */
    public func colorRGB() -> ColorAdjuster.RGBProperties? {
        var rgb = ColorAdjuster.RGBProperties()
        let converted = getRed(&rgb.r, green: &rgb.g, blue: &rgb.b, alpha: &rgb.alpha)
        if converted {
            return rgb
        }
        return nil
    }
}

// MARK: - Create gradation view
extension UIView {
    
    /**
    Create gradation view
    - parameter colors: [CGClor], locations: [CGFloat] =  Please the same count.
    */
    public func layerVerticallyGradient(colors colors: [AnyObject], locations: [CGFloat]) {
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        gradientLayer.colors = colors as [AnyObject]
        gradientLayer.locations = locations
        ColorAdjuster.sharedInstance.gradientLayer?.removeFromSuperlayer()
        ColorAdjuster.sharedInstance.gradientLayer = gradientLayer
        layer.insertSublayer(gradientLayer, atIndex: 0)
    }
}