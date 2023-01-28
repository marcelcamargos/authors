//
//  PostRouter.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

// MARK: MenuFirstScreenRouter

class PostRouter: PostInternalRouterDelegate {

    weak var viewController: UIViewController?
    
    func showDetail() {
        let detailViewController = DetailViewController()
        DetailConfigurator.configure(viewController: detailViewController)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
