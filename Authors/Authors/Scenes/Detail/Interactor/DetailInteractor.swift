//
//  DetailInteractor.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class DetailInteractor {
    
    // MARK: - Private Properties

    private var presenter: DetailPresenterDelegate
    private var detailWorker: DetailWorkerDelegate
    
    // MARK: - Init

    init(_ presenter: DetailPresenterDelegate, _ detailWorker: DetailWorkerDelegate = DetailWorker()) {
        self.presenter = presenter
        self.detailWorker = detailWorker
    }
}

//MARK: DetailInteractor

extension DetailInteractor: DetailInteractorDelegate {
    func showDetail() {
        detailWorker.getDetail { (detail) in
            let response = DetailModel.Response(detail: detail)
            self.presenter.interactor(didSuccessShowDetail: response)
        } fail: { (message) in
            self.presenter.interactor(didFailShowDetail: message)
        }
    }
}
