//
//  PostRouter.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

// MARK: PostRouter

class PostRouter: PostInternalRouterDelegate {

    weak var viewController: UIViewController?
    
    func showDetail(selectedPost: Post) {
        let detailViewController = DetailViewController(selectedPost: selectedPost)
        DetailConfigurator.configure(viewController: detailViewController)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
