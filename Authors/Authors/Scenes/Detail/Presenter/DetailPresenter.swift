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
        let presenterToView = CoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessSaveCoreData: presenterToView)
    }
    
    func interactor(didFailSaveCoreData error: String) {
        viewController?.presenter(didFailSaveCoreData: error)
    }
    
    func interactor(didSuccessFindCoreData response: FindCoreDataModel.Response) {
        let presenterToView = FindCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessFindCoreData: presenterToView)
    }
    
    func interactor(didFailFindCoreData error: String) {
        viewController?.presenter(didFailFindCoreData: error)
    }
    
    func interactor(didSuccessDeletionCoreData response: FindCoreDataModel.Response) {
        let presenterToView = FindCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessDeletionCoreData: presenterToView)
    }
    
    func interactor(didFailDeletionCoreData error: String) {
        viewController?.presenter(didFailDeletionCoreData: error)
    }
    
    func interactor(didSuccessSaveUsersCoreData response: DetailCoreDataModel.Response) {
        let presenterToView = DetailCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessSaveUsersCoreData: presenterToView)
    }
    
    func interactor(didFailSaveUsersCoreData error: String) {
        viewController?.presenter(didFailSaveUsersCoreData: error)
    }
    
    func interactor(didSuccessSaveCommentsCoreData response: CommentCoreDataModel.Response) {
        let presenterToView = CommentCoreDataModel.ViewModel(result: response.result)
        viewController?.presenter(didSuccessSaveCommentsCoreData: presenterToView)
    }
    
    func interactor(didFailSaveCommentsCoreData error: String) {
        viewController?.presenter(didFailSaveCommentsCoreData: error)
    }
}
