![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/Logo.png?raw=true)

[![CI Status](http://img.shields.io/travis/ikemai/ColorAdjuster.svg?style=flat)](https://travis-ci.org/ikemai/ColorAdjuster)
[![Version](https://img.shields.io/cocoapods/v/ColorAdjuster.svg?style=flat)](http://cocoapods.org/pods/ColorAdjuster)
[![License](https://img.shields.io/cocoapods/l/ColorAdjuster.svg?style=flat)](http://cocoapods.org/pods/ColorAdjuster)
[![Platform](https://img.shields.io/cocoapods/p/ColorAdjuster.svg?style=flat)](http://cocoapods.org/pods/ColorAdjuster)

ColorAdjuster is the library which can create a new color by HBS or RGB for the cause in base color, and create gradation view.

### Demo

* UIColor can regulate numerical value of HBS and RGB of the target color.

![Gif](https://raw.githubusercontent.com/ikemai/assets/master/ColorAdjuster/colorHBSdemo.gif)
![Gif](https://raw.githubusercontent.com/ikemai/assets/master/ColorAdjuster/colorRGBdemo.gif)

* UIView can make gradation of Gradation.
* You can coordinate gradation colors with the number of any colors.

![Gif](https://raw.githubusercontent.com/ikemai/assets/master/ColorAdjuster/colorGradationdemo.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
 
* swift 2.0, iOS8.0 ~

## Installation

ColorAdjuster is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ColorAdjuster"
```

## Example

* Appoint it in hexadecimal and create UIColor.

```swift
let color = UIColor(hex: 0xB7EAE7)
```

# HBS

* Ajustment color of HBS.

```swift
let adjustmentColor = color.colorWithHBSComponent(hue: hueValue, brightness: brightnessValue, saturation: saturationValue)
adjustmentColorView.backgroundColor = adjustmentColor
```

* Get HBS value of color.

```swift
if let hbs = adjustmentColor?.colorHBS() {
    print("Hue = \(hbs.hue)")
    print("Bridhtness = \(hbs.brightness)")
    print("Saturation = \(hbs.saturation)")
}
```

# RGB

* Ajustment color of RGB.

```swift
let adjustmentColor = color.colorWithRGBComponent(r: rValue, g: gValue, b: bValue)
targetView.backgroundColor = adjustmentColor
```

* Get RGB value of color.

```swift
if let rbg = adjustmentColor?.colorRGB() {
    print("Red = \(rbg.r)")
    print("Green = \(rbg.g)")
    print("Blue = \(rbg.b)")
}
```

# Create gradation view.

```swift
let targetView = UIView(frame: frame)
let colors: [CGColor] = [UIColor.redColor().CGColor, UIColor.magentaColor().CGColor]
view.addSubView(targetView)
```

Appoint locations
```swift
let locations: [CGFloat] = [0.0, 1.0]
targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, locations: locations)
```
![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/Zero.png?raw=true)

Appoint startPoint and endPoint
```swift
let startPoint = CGPointMake(1, 0.5)
let endPoint = CGPointMake(0, 0.5)
targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
```
![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/Ninety.png?raw=true)

Appoint Angle = Zero
```swift
targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, angle: .Zero)
```
![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/Zero.png?raw=true)

Appoint Angle = FortyFive
```swift
targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, angle: .FortyFive)
```
![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/FortyFive.png?raw=true)

Appoint Ninety
```swift
targetView.ca_gradientLayer.insertLayerVerticallyGradient(colors: colors, angle: .Ninety)
```
![Png](https://github.com/ikemai/assets/blob/master/ColorAdjuster/Ninety.png?raw=true)

## Function

* Appoint it in hexadecimal and create UIColor.

```swift
public convenience init(hex: Int, alpha: CGFloat = 1)
```

* UIColor ajustment color of HBS.

```swift
public func colorWithHBSComponent(hue hue: CGFloat, brightness: CGFloat, saturation: CGFloat) -> UIColor?
```

* UIColor get HBS value of color.

```swift
public func colorHBS() -> ColorAdjuster.HBSProperties?
```

* UIColor ajustment color of RGB.

```swift
public func colorWithRGBComponent(r r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor?
```

* UIColor get RGB value of color.

```swift
public func colorRGB() -> ColorAdjuster.RGBProperties?
```

* UIView create gradation view.

```swift
public func insertLayerVerticallyGradient(colors colors: [CGColor], locations: [CGFloat]) 

```

## Properties

* Value of HBS

```swift
public struct HBSProperties {
    public var hue: CGFloat = 0
    public var brightness: CGFloat = 0
    public var saturation: CGFloat = 0
    public var alpha: CGFloat = 1
}
```

* Value of RGB

```swift
public struct RGBProperties {
    public var r: CGFloat = 0
    public var g: CGFloat = 0
    public var b: CGFloat = 0
    public var alpha: CGFloat = 1
}
```

## Author

ikemai

## License

ColorAdjuster is available under the MIT license. See the LICENSE file for more info.
