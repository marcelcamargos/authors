//
//  DetailConfigurator.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class DetailConfigurator {
    
    static func configure(viewController: DetailViewController) {
        let router = DetailRouter()
        let presenter = DetailPresenter(viewController)
        let interactor = DetailInteractor(presenter)

        viewController.router = router
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.hidesBottomBarWhenPushed = true
    }
}
