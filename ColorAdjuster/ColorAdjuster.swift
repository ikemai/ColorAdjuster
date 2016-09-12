//
//  ColorAdjuster.swift
//  ColorAdjuster
//
//  Created by Mai Ikeda on 2015/10/15.
//  Copyright © 2015年 mai_ikeda. All rights reserved.
//

import UIKit

open class ColorAdjuster: UIView {
    
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
        public var red: CGFloat = 0
        public var green: CGFloat = 0
        public var blue: CGFloat = 0
        public var alpha: CGFloat = 1
    }
}

open class ColorAdjusterGradientView {

    public enum Angle {
        case zero, fortyFive, ninety
    }
    
    fileprivate weak var view: UIView?
    fileprivate weak var gradientLayer: CAGradientLayer?
    
    init(view: UIView) {
        self.view = view
    }
    
    /**
    Create gradation view
    - parameter colors: [CGClor], locations: [CGFloat] =  Please the same count.
    */
    open func insertLayerVerticallyGradient(colors: [CGColor], locations: [CGFloat]) {
        insertLayerVerticallyGradient(colors, locations: locations)
    }
    
    /**
     Create gradation view
     - parameter colors: [CGClor], startPoint: CGPoint, endPoint: CGPoint
     */
    open func insertLayerVerticallyGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        insertLayerVerticallyGradient(colors, startPoint: startPoint, endPoint: endPoint)
    }
    
    /**
     Create gradation view
     - parameter colors: [CGClor], angle: Angle
     */
    open func insertLayerVerticallyGradient(colors: [CGColor], angle: Angle) {
        insertLayerVerticallyGradient(colors, angle: angle)
    }
    
    fileprivate func insertLayerVerticallyGradient(_ colors: [CGColor], locations: [CGFloat]? = nil, startPoint: CGPoint? = nil, endPoint: CGPoint? = nil, angle: Angle? = nil) {
        guard let view = view else { return }
        let layer = CAGradientLayer()
        layer.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
        layer.colors = colors as [AnyObject]
        if let locations = locations {
            layer.locations = locations as [NSNumber]?
        }
        if let startPoint = startPoint, let endPoint = endPoint {
            layer.startPoint = startPoint
            layer.endPoint = endPoint
        }
        if let angle = angle {
            let points = getAnglePoint(angle)
            layer.startPoint = points[0]
            layer.endPoint = points[1]
        }
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = layer
        view.layer.insertSublayer(layer, at: 0)
    }
    
    fileprivate func getAnglePoint(_ angle: Angle) -> [CGPoint] {
        var startPoint: CGPoint
        var endPoint: CGPoint
        switch angle {
        case .zero:
            startPoint = CGPoint(x: 0.5, y: 0)
            endPoint = CGPoint(x: 0.5, y: 1)
        case .fortyFive:
            startPoint = CGPoint(x: 1, y: 0)
            endPoint = CGPoint(x: 0, y: 1)
        case .ninety:
            startPoint = CGPoint(x: 1, y: 0.5)
            endPoint = CGPoint(x: 0, y: 0.5)
        }
        return [startPoint, endPoint]
    }
}

extension UIColor {
    
    /**
    Appoint it in hexadecimal and create UIColor.
    */
    public convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0x00FF00) >> 8 ) / 255
        let blue = CGFloat((hex & 0x0000FF) >> 0 ) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: - Change a value of HBS
extension UIColor {
    
    /**
    Adjustment color by HBS
    - parameter hue, brightness, saturation = 0~1
    */
    public func colorWithHBSComponent(hue: CGFloat, brightness: CGFloat, saturation: CGFloat) -> UIColor? {
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
    public func colorWithRGBComponent(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor? {
        if let rgb = colorRGB() {
            return UIColor(red: (rgb.red * red), green: (rgb.green * green), blue: (rgb.blue * blue), alpha: rgb.alpha)
        }
        return nil
    }
    
    /**
    Get color RGB
    */
    public func colorRGB() -> ColorAdjuster.RGBProperties? {
        var rgb = ColorAdjuster.RGBProperties()
        let converted = getRed(&rgb.red, green: &rgb.green, blue: &rgb.blue, alpha: &rgb.alpha)
        if converted {
            return rgb
        }
        return nil
    }
}

var colorAdjusterGradientViewAssociationKey = "colorAdjusterGradientViewAssociation"

// MARK: - Create gradation view
extension UIView {
    
    public var gradientLayer: ColorAdjusterGradientView {
        get {
            if let instance = objc_getAssociatedObject(self, &colorAdjusterGradientViewAssociationKey) as? ColorAdjusterGradientView {
                return instance
            }
            let instance = ColorAdjusterGradientView(view: self)
            objc_setAssociatedObject(self, &colorAdjusterGradientViewAssociationKey, instance, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return instance
        }
    }
}
