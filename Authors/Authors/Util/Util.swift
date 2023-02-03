//
//  Util.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.center = (aView ?? UIView()).center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView ?? UIView())
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
