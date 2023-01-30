//
//  DetailPresenter.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class DetailPresenter {
    
    // MARK: - Private Properties
    
    private weak var viewController: DetailViewControllerDelegate?
    
    // MARK: - Init
    
    init(_ viewController: DetailViewControllerDelegate) {
        self.viewController = viewController
    }
}

// MARK: - DetailPresenter

extension DetailPresenter: DetailPresenterDelegate {
    func interactor(didSuccessShowDetail response: DetailModel.Response) {
        let presenterToView = DetailModel.ViewModel(users: response.users, comments: response.comments)
        
        viewController?.presenter(didSuccessShowDetail: presenterToView)
    }
    
    func interactor(didFailShowDetail error: String) {
        viewController?.presenter(didFailShowDetail: error)
    }
    
    func interactor(didSuccessDeletion response: DeletionModel.Response) {
        let presenterToView = DeletionModel.ViewModel(result: response.result)
        
        viewController?.presenter(didSuccessDeletion: presenterToView)
    }
    
    func interactor(didFailDeletion error: String) {
        viewController?.presenter(didFailDeletion: error)
    }
    
    func interactor(didSuccessSaveCoreData response: CoreDataModel.Response) {
        
    }
    
    func interactor(didFailSaveCoreData error: String) {
        
    }
}
