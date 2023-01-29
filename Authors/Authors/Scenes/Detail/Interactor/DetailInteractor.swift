//
//  DetailInteractor.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

class DetailInteractor {
    
    // MARK: - Private Properties
    
    private var presenter: DetailPresenterDelegate
    private var detailWorker: DetailWorkerDelegate
    private var commentWorker: CommentWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: DetailPresenterDelegate, _ detailWorker: DetailWorkerDelegate = DetailWorker(), _ commentWorker: CommentWorkerDelegate = CommentWorker()) {
        self.presenter = presenter
        self.detailWorker = detailWorker
        self.commentWorker = commentWorker
    }
}

//MARK: DetailInteractor

extension DetailInteractor: DetailInteractorDelegate {
    func showDetail(request: DetailModel.Request) {
        detailWorker.getDetail { [weak self] (users) in
            self?.commentWorker.getComments(postId: request.post.id) { [weak self] (comments) in
                let response = DetailModel.Response(users: users, comments: comments)
                self?.presenter.interactor(didSuccessShowDetail: response)
            } fail: { (message) in
                self?.presenter.interactor(didFailShowDetail: message)
            }
        } fail: { (message) in
            self.presenter.interactor(didFailShowDetail: message)
        }
    }
}
