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
    private var postDeletionWorker: PostDeletionWorkerDelegate
    private var deviceSaveDataWorkerDelegate: DeviceSaveDataWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: DetailPresenterDelegate, _ detailWorker: DetailWorkerDelegate = DetailWorker(), _ commentWorker: CommentWorkerDelegate = CommentWorker(), _ postDeletionWorker: PostDeletionWorkerDelegate = PostDeletionWorker(), _ deviceSaveDataWorkerDelegate: DeviceSaveDataWorkerDelegate = DeviceSaveDataWorker()) {
        self.presenter = presenter
        self.detailWorker = detailWorker
        self.commentWorker = commentWorker
        self.postDeletionWorker = postDeletionWorker
        self.deviceSaveDataWorkerDelegate = deviceSaveDataWorkerDelegate
    }
}

//MARK: DetailInteractor

extension DetailInteractor: DetailInteractorDelegate {
    func saveToCoreData(request: CoreDataModel.Request) {
        deviceSaveDataWorkerDelegate.createData(post: request.post, favourite: request.favourite) { [weak self] (result) in
            let response = CoreDataModel.Response(result: result)
            self?.presenter.interactor(didSuccessSaveCoreData: response)
        } fail: { (message) in
            self.presenter.interactor(didFailSaveCoreData: message)
        }
    }
    
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
    
    func processDelete(request: DeletionModel.Request) {
        postDeletionWorker.deletePost(postId: request.post.id) { [weak self] (result) in
            let response = DeletionModel.Response(result: result)
            self?.presenter.interactor(didSuccessDeletion: response)
        } fail: { (message) in
            self.presenter.interactor(didFailDeletion: message)
        }
    }
}
