//
//  ViewController.swift
//  Toning
//
//  Created by Jason Hsu on 2018/7/26.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var boarderSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var bujiImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var frontContainerView: UIView!
    
    @IBAction func colorSliderChange(_ sender: Any) {
        //設定背景色彩反轉
        let redInverse: Float = 1 - redSlider.value
        let greenInverse: Float = 1 - greenSlider.value
        let blueInverse: Float = 1 - blueSlider.value
        //調整色彩設定
        bujiImageView.backgroundColor =  UIColor(red: CGFloat(redSlider.value), green:  CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        frontImageView.backgroundColor =  UIColor(red: CGFloat(redInverse), green:  CGFloat(greenInverse), blue: CGFloat(blueInverse), alpha: 0.5)
        //顯示色彩數值
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", alphaSlider.value)
    }
    //加入色彩調整的開關
    @IBAction func redSliderSwitch(_ sender: Any) {
        if redSwitch.isOn {
            redSlider.isEnabled = true
        } else {
            redSlider.isEnabled = false
        }
    }
    
    @IBAction func greenSliderSwitch(_ sender: Any) {
        if greenSwitch.isOn {
            greenSlider.isEnabled = true
        } else {
            greenSlider.isEnabled = false
        }
    }
    
    @IBAction func blueSliderSwitch(_ sender: Any) {
        if blueSwitch.isOn {
            blueSlider.isEnabled = true
        } else {
            blueSlider.isEnabled = false
        }
    }
    //調整圓角大小
    @IBAction func radiusSliderChange(_ sender: Any) {
        //影像裁切
        frontImageView.clipsToBounds = true
        bujiImageView.clipsToBounds = true
        //加入圓角
        frontContainerView.layer.cornerRadius = CGFloat(radiusSlider.value)
        bujiImageView.layer.cornerRadius =  CGFloat(radiusSlider.value )
        frontImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    //調整邊框大小
    @IBAction func boarderChange(_ sender: Any) {
        //調整邊框寬度
        bujiImageView.layer.borderWidth = CGFloat(boarderSlider.value)
        //設定邊框顏色
        bujiImageView.layer.borderColor = UIColor.red.cgColor
    }
    //調整陰影
    @IBAction func shadowSliderChange(_ sender: Any) {
        // 設定陰影偏移位置
        frontContainerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        // 設定陰影顏色
        frontContainerView.layer.shadowColor = UIColor.darkGray.cgColor
        // 設定陰影透明度
        frontContainerView.layer.shadowOpacity = 0.9
        // 設定陰影範圍
        frontContainerView.layer.shadowRadius = CGFloat(shadowSlider.value)
        
    }
    
    @IBAction func gradientSliderChange(_ sender: Any) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frontImageView.layer.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.magenta.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: CGFloat(gradientSlider.value), y: CGFloat(gradientSlider.value))
        frontImageView.layer.addSublayer(gradientLayer)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
   
    
}

