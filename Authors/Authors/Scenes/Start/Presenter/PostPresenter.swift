//
//  PostPresenter.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class PostPresenter {

    // MARK: - Private Properties

    private weak var viewController: PostViewControllerDelegate?

    // MARK: - Init

    init(_ viewController: PostViewControllerDelegate?) {
        self.viewController = viewController
    }
}

// MARK: - PostPresenter

extension PostPresenter: PostPresenterDelegate {
    func interactor(didSuccessShowPost response: PostModel.Response) {
        let presenterToView = PostModel.ViewModel(items: response.items)
        
        viewController?.presenter(didSuccessShowPost: presenterToView)
    }
    
    func interactor(didFailShowPost error: String) {
        viewController?.presenter(didFailShowPost: error)
    }
}
