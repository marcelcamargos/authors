//
//  PostConfigurator.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

class PostConfigurator {

    static func configure(viewController: PostViewController) {
        let router = PostRouter()
        let presenter = PostPresenter(viewController)
        let interactor = PostInteractor(presenter)
        viewController.router = router
        viewController.interactor = interactor
        router.viewController = viewController
    }
}
