//
//  view extensions.swift
//  task
//
//  Created by Ios Dev on 10/4/24.
//


import Foundation
import UIKit


// MARK: - UIView Extensions

@IBDesignable
extension UIView {
    
    // Rounded Corners and Border
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var topCornerRadius: CGFloat {
        get {
            return layer.maskedCorners.contains(.layerMinXMinYCorner) ? layer.cornerRadius : 0
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            layer.masksToBounds = newValue > 0
        }
    }
    
    // Shadow
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowPath: UIBezierPath? {
        get {
            guard let cgPath = layer.shadowPath else { return nil }
            return UIBezierPath(cgPath: cgPath)
        }
        set {
            layer.shadowPath = newValue?.cgPath
        }
    }
    
    // Rotation
    @IBInspectable var rotation: CGFloat {
        get {
            return layer.value(forKeyPath: "transform.rotation.z") as? CGFloat ?? 0
        }
        set {
            layer.transform = CATransform3DMakeRotation(newValue, 0, 0, 1)
        }
    }
}

// MARK: - GradientView

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .clear {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var endColor: UIColor = .clear {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            updatePoints()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            updatePoints()
        }
    }
    
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    private func setupLayer() {
        updateColors()
        updatePoints()
    }
    
    private func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    private func updatePoints() {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
}
