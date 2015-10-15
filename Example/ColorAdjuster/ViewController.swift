//
//  ViewController.swift
//  ColorAdjuster
//
//  Created by ikemai on 10/09/2015.
//  Copyright (c) 2015 ikemai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var adjustmentHbsView: AdjustmentHbsView!
    @IBOutlet weak var adjustmentRgbView: AdjustmentRbgView!
    @IBOutlet weak var adjustmentGradationView: AdjustmentGradationView!
    
    @IBOutlet weak var hbsButton: UIButton!
    @IBOutlet weak var rgbButton: UIButton!
    @IBOutlet weak var gradationButton: UIButton!
    
    @IBOutlet weak var colorButton1: UIButton!
    @IBOutlet weak var colorButton2: UIButton!
    @IBOutlet weak var colorButton3: UIButton!
    @IBOutlet weak var colorButton4: UIButton!
    @IBOutlet weak var colorButton5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cornerRadius: CGFloat = 8
        hbsButton.layer.cornerRadius = cornerRadius
        rgbButton.layer.cornerRadius = cornerRadius
        gradationButton.layer.cornerRadius = cornerRadius
        
        colorButton1.layer.cornerRadius = colorButton1.bounds.height / 2
        colorButton2.layer.cornerRadius = colorButton2.bounds.height / 2
        colorButton3.layer.cornerRadius = colorButton3.bounds.height / 2
        colorButton4.layer.cornerRadius = colorButton4.bounds.height / 2
        colorButton5.layer.cornerRadius = colorButton5.bounds.height / 2
        
        adjustmentGradationView.hidden = true
        adjustmentRgbView.hidden = true
        updateButtonColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController {
    
    @IBAction func hbsButtonDown(sender: AnyObject) {
        adjustmentHbsView.hidden = false
        adjustmentGradationView.hidden = true
        adjustmentRgbView.hidden = true
        updateButtonColor()
    }
    
    @IBAction func rgbButtonDown(sender: AnyObject) {
        adjustmentHbsView.hidden = true
        adjustmentGradationView.hidden = true
        adjustmentRgbView.hidden = false
        updateButtonColor()
    }
    
    @IBAction func gradationButtonDown(sender: AnyObject) {
        adjustmentHbsView.hidden = true
        adjustmentGradationView.hidden = false
        adjustmentRgbView.hidden = true
        updateButtonColor()
    }
    
    private func updateButtonColor() {
        let defaultButtonColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        let selectedButtonColor = UIColor.redColor()
        
        hbsButton.backgroundColor = adjustmentHbsView.hidden ? defaultButtonColor : selectedButtonColor
        rgbButton.backgroundColor = adjustmentRgbView.hidden ? defaultButtonColor : selectedButtonColor
        gradationButton.backgroundColor = adjustmentGradationView.hidden ? defaultButtonColor : selectedButtonColor
    }
}

// MARK: - Slider
extension ViewController {
    
    @IBAction func hueValueChanged(sender: AnyObject) {
        adjustmentHbsView.updateHBSColor()
    }
    @IBAction func saturationValueChanged(sender: AnyObject) {
        adjustmentHbsView.updateHBSColor()
    }
    @IBAction func brightnessValueChanged(sender: AnyObject) {
        adjustmentHbsView.updateHBSColor()
    }
    @IBAction func rValueChanged(sender: AnyObject) {
        adjustmentRgbView.updateRGBColor()
    }
    @IBAction func gValueChanged(sender: AnyObject) {
        adjustmentRgbView.updateRGBColor()
    }
    @IBAction func bValueChanged(sender: AnyObject) {
        adjustmentRgbView.updateRGBColor()
    }
}

// MARK: - Sumplae color
extension ViewController {
    
    @IBAction func button1Down(sender: AnyObject) {
        updateSumpleColor(colorButton1.backgroundColor)
    }
    
    @IBAction func button2Down(sender: AnyObject) {
        updateSumpleColor(colorButton2.backgroundColor)
    }
    
    @IBAction func button3Down(sender: AnyObject) {
        updateSumpleColor(colorButton3.backgroundColor)
    }
    
    @IBAction func button4Down(sender: AnyObject) {
        updateSumpleColor(colorButton4.backgroundColor)
    }
    
    @IBAction func button5Down(sender: AnyObject) {
        updateSumpleColor(colorButton5.backgroundColor)
    }
    
    private func updateSumpleColor(color: UIColor?) {
        if let color = color {
            if !adjustmentHbsView.hidden { adjustmentHbsView.updateBaseColor(color) }
            if !adjustmentRgbView.hidden { adjustmentRgbView.updateBaseColor(color) }
            if !adjustmentGradationView.hidden { adjustmentGradationView.updateGradation(color) }
        }
    }
}
