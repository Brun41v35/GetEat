//
//  GEButton.swift
//  GetEat
//
//  Created by Mobile2you on 20/06/21.
//

import UIKit

class GEButton: UIButton {
    
    //MARK: - Variables
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    @IBInspectable var indicatorColor : UIColor = .white
    
    //MARK: - Functions
    func showButtonLoading(show: Bool) {
        if show {
            showLoading()
        } else {
            hideLoading()
        }
    }
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        setTitle("", for: .normal)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
    }
    
    func hideLoading() {
        setTitle(titleLabel?.text, for: .normal)
        if (activityIndicator != nil) {
            activityIndicator.stopAnimating()
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = indicatorColor
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
