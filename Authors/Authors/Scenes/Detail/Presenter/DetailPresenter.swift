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
        let news = response.detail
        
        let presenterToView = DetailModel.ViewModel(title: news.title,
                                                        shortDescription: news.shortDescription,
                                                        longDescription: news.longDescription)
        
        viewController?.presenter(didSuccessShowDetail: presenterToView)
    }
    
    func interactor(didFailShowDetail error: String) {
        viewController?.presenter(didFailShowDetail: error)
    }
}
