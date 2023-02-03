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
    private var deviceFindDataWorkerDelegate: DeviceFindDataWorkerDelegate
    private var deviceDeletionDataWorkerDelegate: DeviceDeletionDataWorkerDelegate
    private var deviceDeletionAllGeoDataWorkerDelegate: DeviceDeletionAllGeoDataWorkerDelegate
    private var deviceDeletionAllAddressDataWorkerDelegate: DeviceDeletionAllAddressDataWorkerDelegate
    private var deviceDeletionAllCompanyDataWorkerDelegate: DeviceDeletionAllCompanyDataWorkerDelegate
    private var deviceDeletionAllCommentsDataWorkerDelegate: DeviceDeletionAllCommentsDataWorkerDelegate
    private var deviceDeletionAllUserDataWorkerDelegate: DeviceDeletionAllUserDataWorkerDelegate
    private var deviceSaveAllUserDataWorkerDelegate: DeviceSaveAllUserDataWorkerDelegate
    private var deviceSaveAllCommentsDataWorkerDelegate: DeviceSaveAllCommentsDataWorkerDelegate
    private var networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate
    private var commentAllWorkerDelegate: CommentAllWorkerDelegate
    private var deviceFindAllUserDataWorkerDelegate: DeviceFindAllUserDataWorkerDelegate
    private var deviceFindAllCommentsDataWorkerDelegate: DeviceFindAllCommentsDataWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: DetailPresenterDelegate, _ detailWorker: DetailWorkerDelegate = DetailWorker(), _ commentWorker: CommentWorkerDelegate = CommentWorker(), _ postDeletionWorker: PostDeletionWorkerDelegate = PostDeletionWorker(), _ deviceSaveDataWorkerDelegate: DeviceSaveDataWorkerDelegate = DeviceSaveDataWorker(), _ deviceFindDataWorkerDelegate: DeviceFindDataWorkerDelegate = DeviceFindDataWorker(), _ deviceDeletionDataWorkerDelegate: DeviceDeletionDataWorkerDelegate = DeviceDeletionDataWorker(), _ deviceDeletionAllGeoDataWorkerDelegate: DeviceDeletionAllGeoDataWorkerDelegate = DeviceDeletionAllGeoDataWorker(), _ deviceDeletionAllAddressDataWorkerDelegate: DeviceDeletionAllAddressDataWorkerDelegate = DeviceDeletionAllAddressDataWorker(), _ deviceDeletionAllCompanyDataWorkerDelegate: DeviceDeletionAllCompanyDataWorkerDelegate = DeviceDeletionAllCompanyDataWorker(), _ deviceDeletionAllCommentsDataWorkerDelegate: DeviceDeletionAllCommentsDataWorkerDelegate = DeviceDeletionAllCommentsDataWorker(), _ deviceDeletionAllUserDataWorkerDelegate: DeviceDeletionAllUserDataWorkerDelegate = DeviceDeletionAllUserDataWorker(), _ deviceSaveAllUserDataWorkerDelegate: DeviceSaveAllUserDataWorkerDelegate = DeviceSaveAllUserDataWorker(), _ deviceSaveAllCommentsDataWorkerDelegate: DeviceSaveAllCommentsDataWorkerDelegate = DeviceSaveAllCommentsDataWorker(), _ networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate = NetworkMonitorWorker(), _ commentAllWorkerDelegate: CommentAllWorkerDelegate = CommentAllWorker(), _ deviceFindAllUserDataWorkerDelegate: DeviceFindAllUserDataWorkerDelegate = DeviceFindAllUserDataWorker(), _ deviceFindAllCommentsDataWorkerDelegate: DeviceFindAllCommentsDataWorkerDelegate = DeviceFindAllCommentsDataWorker()) {
        self.presenter = presenter
        self.detailWorker = detailWorker
        self.commentWorker = commentWorker
        self.postDeletionWorker = postDeletionWorker
        self.deviceSaveDataWorkerDelegate = deviceSaveDataWorkerDelegate
        self.deviceFindDataWorkerDelegate = deviceFindDataWorkerDelegate
        self.deviceDeletionDataWorkerDelegate = deviceDeletionDataWorkerDelegate
        self.deviceDeletionAllGeoDataWorkerDelegate = deviceDeletionAllGeoDataWorkerDelegate
        self.deviceDeletionAllAddressDataWorkerDelegate = deviceDeletionAllAddressDataWorkerDelegate
        self.deviceDeletionAllCompanyDataWorkerDelegate = deviceDeletionAllCompanyDataWorkerDelegate
        self.deviceDeletionAllCommentsDataWorkerDelegate = deviceDeletionAllCommentsDataWorkerDelegate
        self.deviceDeletionAllUserDataWorkerDelegate = deviceDeletionAllUserDataWorkerDelegate
        self.deviceSaveAllUserDataWorkerDelegate = deviceSaveAllUserDataWorkerDelegate
        self.deviceSaveAllCommentsDataWorkerDelegate = deviceSaveAllCommentsDataWorkerDelegate
        self.networkMonitorWorkerDelegate = networkMonitorWorkerDelegate
        self.commentAllWorkerDelegate = commentAllWorkerDelegate
        self.deviceFindAllUserDataWorkerDelegate = deviceFindAllUserDataWorkerDelegate
        self.deviceFindAllCommentsDataWorkerDelegate = deviceFindAllCommentsDataWorkerDelegate
    }
}

//MARK: DetailInteractor

extension DetailInteractor: DetailInteractorDelegate {
    
    func saveToCoreData(request: CoreDataModel.Request) {
        deviceSaveDataWorkerDelegate.createData(post: request.post) { [weak self] (result) in
            let response = CoreDataModel.Response(result: result)
            self?.presenter.interactor(didSuccessSaveCoreData: response)
        } fail: { (message) in
            self.presenter.interactor(didFailSaveCoreData: message)
        }
    }
    
    func showDetail(request: DetailModel.Request) {
        
        networkMonitorWorkerDelegate.startMonitoring { [weak self] (state) in
            guard let self = self else { return }
            
            if ConnectionState.connected == state {
                
                self.detailWorker.getDetail { [weak self] (users) in
                    self?.commentWorker.getComments(postId: request.post.id) { [weak self] (comments) in
                        let response = DetailModel.Response(users: users, comments: comments)
                        self?.presenter.interactor(didSuccessShowDetail: response)
                        
                        self?.deviceDeletionAllGeoDataWorkerDelegate.deleteAllGeoData() { [weak self] (result) in
                            
                            self?.deviceDeletionAllAddressDataWorkerDelegate.deleteAllAddressData() { [weak self] (result) in
                                
                                self?.deviceDeletionAllCompanyDataWorkerDelegate.deleteAllCompanyData() { [weak self] (result) in
                                    
                                    self?.deviceDeletionAllCommentsDataWorkerDelegate.deleteAllCommentsData() { [weak self] (result) in
                                        
                                        self?.deviceDeletionAllUserDataWorkerDelegate.deleteAllUserData() { [weak self] (result) in
                                            
                                            let request = DetailCoreDataModel.Request(users: users)
                                            self?.saveAllUserToCoreData(request: request)
                                            
                                            self?.commentAllWorkerDelegate.getAllComments()  { [weak self] (comments) in
                                                let requestComments = CommentCoreDataModel.Request(comments: comments)
                                                self?.saveAllCommentsToCoreData(request: requestComments)
                                            } fail: { (message) in
                                                
                                            }
                                            
                                        } fail: { (message) in
                                            
                                        }
                                        
                                    } fail: { (message) in
                                        
                                    }
                                    
                                } fail: { (message) in
                                    
                                }
                                
                            } fail: { (message) in
                                
                            }
                            
                        } fail: { (message) in
                            
                        }
                        
                    } fail: { (message) in
                        self?.presenter.interactor(didFailShowDetail: message)
                    }
                } fail: { (message) in
                    self.presenter.interactor(didFailShowDetail: message)
                }
                
            } else {
                self.deviceFindAllUserDataWorkerDelegate.findAllUserData() { [weak self] (users) in
                    self?.deviceFindAllCommentsDataWorkerDelegate.findAllCommentsData(post: request.post) { [weak self] (comments) in
                        let response = DetailModel.Response(users: users, comments: comments)
                        self?.presenter.interactor(didSuccessShowDetail: response)
                        
                    } fail: { (message) in
                        self?.presenter.interactor(didFailShowDetail: message)
                    }
                } fail: { (message) in
                    self.presenter.interactor(didFailShowDetail: message)
                }
            }
            
        } fail: { (message) in
            
        }
    }
    
    func processDelete(request: DeletionModel.Request) {
        postDeletionWorker.deletePost(postId: request.post.id) { [weak self] (result) in
            let response = DeletionModel.Response(result: result)
            self?.presenter.interactor(didSuccessDeletion: response)
        } fail: { [weak self] (message) in
            self?.presenter.interactor(didFailDeletion: message)
        }
    }
    
    func findByPost(request: FindCoreDataModel.Request) {
        deviceFindDataWorkerDelegate.findByPost(post: request.post) { [weak self] (favourite) in
            let response = FindCoreDataModel.Response(result: favourite)
            self?.presenter.interactor(didSuccessFindCoreData: response)
        } fail: { [weak self] (message) in
            self?.presenter.interactor(didFailFindCoreData: message)
        }
    }
    
    func deleteData(request: FindCoreDataModel.Request) {
        deviceDeletionDataWorkerDelegate.deleteData(post: request.post) { [weak self] (deleted) in
            let response = FindCoreDataModel.Response(result: deleted)
            self?.presenter.interactor(didSuccessDeletionCoreData: response)
        } fail: { [weak self] (message) in
            self?.presenter.interactor(didFailDeletionCoreData: message)
        }
    }
    
    func saveAllUserToCoreData(request: DetailCoreDataModel.Request) {
        deviceSaveAllUserDataWorkerDelegate.createData(users: request.users) { [weak self] (result) in
            let response = DetailCoreDataModel.Response(result: result)
            self?.presenter.interactor(didSuccessSaveUsersCoreData: response)
        } fail: { [weak self] (message) in
            self?.presenter.interactor(didFailSaveUsersCoreData: message)
        }
    }
    
    func saveAllCommentsToCoreData(request: CommentCoreDataModel.Request) {
        deviceSaveAllCommentsDataWorkerDelegate.createData(comments: request.comments) { [weak self] (result) in
            let response = DetailCoreDataModel.Response(result: result)
            self?.presenter.interactor(didSuccessSaveUsersCoreData: response)
        } fail: { [weak self] (message) in
            self?.presenter.interactor(didFailSaveUsersCoreData: message)
        }
    }
}
