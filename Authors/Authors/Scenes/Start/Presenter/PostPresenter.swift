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
        let presenterToView = PostModel.ViewModel(items: response.posts, favourites: response.favourites)
        
        viewController?.presenter(didSuccessShowPost: presenterToView)
    }
    
    func interactor(didFailShowPost error: String) {
        viewController?.presenter(didFailShowPost: error)
    }
    
    func interactor(didSuccessSaveAllCoreData response: StartCoreDataModel.Response) {
        let presenterToView = StartCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessSaveAllCoreData: presenterToView)
    }
    
    func interactor(didFailSaveAllCoreData error: String) {
        viewController?.presenter(didFailSaveAllCoreData: error)
    }
    
    func interactor(didSuccessDeleteAllCoreData response: DeleteAllPostCoreDataModel.Response) {
        let presenterToView = DeleteAllPostCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessDeleteAllCoreData: presenterToView)
    }
    
    func interactor(didFailDeleteAllCoreData error: String) {
        viewController?.presenter(didFailDeleteAllCoreData: error)
    }
}
