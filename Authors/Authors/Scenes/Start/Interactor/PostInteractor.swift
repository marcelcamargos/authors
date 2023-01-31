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
    private var deviceFindAllDataWorkerDelegate: DeviceFindAllDataWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: PostPresenterDelegate?, _ postWorker: PostWorkerDelegate1 = PostWorker1(), _ deviceFindAllDataWorkerDelegate: DeviceFindAllDataWorkerDelegate = DeviceFindAllDataWorker()) {
        self.presenter = presenter
        self.postWorker = postWorker
        self.deviceFindAllDataWorkerDelegate = deviceFindAllDataWorkerDelegate
    }
}

// MARK: - PostInteractor

extension PostInteractor: PostInteractorDelegate {
    func fetchPosts(uiViewController: UIViewController) {
        postWorker.getPostList { [weak self] (posts) in
            guard let self = self else { return }

            self.deviceFindAllDataWorkerDelegate.findFavourites { [weak self] (items) in
                guard let self = self else { return }
                //let interactorToPresenter2 = FindAllCoreDataModel.Response(wishes: items)
                //edit interactorToPresenter1 according to interactorToPresenter2
                //self?.presenter?.interactor(didSuccessShowPost: interactorToPresenter)
                let interactorToPresenter = PostModel.Response(posts: posts, favourites: items)
                self.presenter?.interactor(didSuccessShowPost: interactorToPresenter)
                
            } fail: { (message) in
                //self?.presenter?.interactor(didFailShowPosts: message)
            }
            
        } fail: { (message) in
            self.presenter?.interactor(didFailShowPost: message)
        }
    }
}
