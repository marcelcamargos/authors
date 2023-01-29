//
//  PostInteractor.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class PostInteractor {

    // MARK: - Private Properties

    private var presenter: PostPresenterDelegate?
    private var postWorker: PostWorkerDelegate1
    
    // MARK: - Init
    
    init(_ presenter: PostPresenterDelegate?, _ postWorker: PostWorkerDelegate1 = PostWorker1()) {
        self.presenter = presenter
        self.postWorker = postWorker
    }
}

// MARK: - PostInteractor

extension PostInteractor: PostInteractorDelegate {
    func fetchPosts(uiViewController: UIViewController) {
        postWorker.getPostList { [weak self] (posts) in
            let interactorToPresenter = PostModel.Response(posts: posts)
            self?.presenter?.interactor(didSuccessShowPost: interactorToPresenter)
        } fail: { (message) in
            self.presenter?.interactor(didFailShowPost: message)
        }
    }
}
