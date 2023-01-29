//
//  Loader.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class Loader {
    private var uiViewController: UIViewController?
    
    public init(uiViewController: UIViewController) {
        self.uiViewController = uiViewController
    }
    
    func startLoading() {
        let alert = UIAlertController(title: nil, message: "Loading posts", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        uiViewController?.parent?.present(alert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        self.uiViewController?.parent?.dismiss(animated: false, completion: nil)
    }
}
