//
//  DetailInteractor.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class DetailInteractor {
    
    // MARK: - Private Properties
    
    private var presenter: DetailPresenterDelegate
    private var detailWorker: DetailWorkerDelegate
    private var commentWorker: CommentWorkerDelegate
    private var postDeletionWorker: PostDeletionWorkerDelegate
    private var deviceSaveDataWorkerDelegate: DeviceSaveDataWorkerDelegate
    private var deviceFindDataWorkerDelegate: DeviceFindDataWorkerDelegate
    private var deviceDeletionDataWorkerDelegate: DeviceDeletionDataWorkerDelegate
    private var deviceDeletionAllDataWorkerDelegate: DeviceDeletionAllDataWorkerDelegate
    private var deviceSaveAllUserDataWorkerDelegate: DeviceSaveAllUserDataWorkerDelegate
    private var deviceSaveAllCommentsDataWorkerDelegate: DeviceSaveAllCommentsDataWorkerDelegate
    private var networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate
    private var commentAllWorkerDelegate: CommentAllWorkerDelegate
    private var deviceFindAllUserDataWorkerDelegate: DeviceFindAllUserDataWorkerDelegate
    private var deviceFindAllCommentsDataWorkerDelegate: DeviceFindAllCommentsDataWorkerDelegate
    private var deviceSaveAllDataWorkerDelegate: DeviceSaveAllDataWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: DetailPresenterDelegate, _ detailWorker: DetailWorkerDelegate = DetailWorker(), _ commentWorker: CommentWorkerDelegate = CommentWorker(), _ postDeletionWorker: PostDeletionWorkerDelegate = PostDeletionWorker(), _ deviceSaveDataWorkerDelegate: DeviceSaveDataWorkerDelegate = DeviceSaveDataWorker(), _ deviceFindDataWorkerDelegate: DeviceFindDataWorkerDelegate = DeviceFindDataWorker(), _ deviceDeletionDataWorkerDelegate: DeviceDeletionDataWorkerDelegate = DeviceDeletionDataWorker(), _ deviceDeletionAllDataWorkerDelegate: DeviceDeletionAllDataWorkerDelegate = DeviceDeletionAllDataWorker(), _ deviceSaveAllUserDataWorkerDelegate: DeviceSaveAllUserDataWorkerDelegate = DeviceSaveAllUserDataWorker(), _ deviceSaveAllCommentsDataWorkerDelegate: DeviceSaveAllCommentsDataWorkerDelegate = DeviceSaveAllCommentsDataWorker(), _ networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate = NetworkMonitorWorker(), _ commentAllWorkerDelegate: CommentAllWorkerDelegate = CommentAllWorker(), _ deviceFindAllUserDataWorkerDelegate: DeviceFindAllUserDataWorkerDelegate = DeviceFindAllUserDataWorker(), _ deviceFindAllCommentsDataWorkerDelegate: DeviceFindAllCommentsDataWorkerDelegate = DeviceFindAllCommentsDataWorker(), _ deviceSaveAllDataWorkerDelegate: DeviceSaveAllDataWorkerDelegate = DeviceSaveAllDataWorker()) {
        self.presenter = presenter
        self.detailWorker = detailWorker
        self.commentWorker = commentWorker
        self.postDeletionWorker = postDeletionWorker
        self.deviceSaveDataWorkerDelegate = deviceSaveDataWorkerDelegate
        self.deviceFindDataWorkerDelegate = deviceFindDataWorkerDelegate
        self.deviceDeletionDataWorkerDelegate = deviceDeletionDataWorkerDelegate
        self.deviceDeletionAllDataWorkerDelegate = deviceDeletionAllDataWorkerDelegate
        self.deviceSaveAllUserDataWorkerDelegate = deviceSaveAllUserDataWorkerDelegate
        self.deviceSaveAllCommentsDataWorkerDelegate = deviceSaveAllCommentsDataWorkerDelegate
        self.networkMonitorWorkerDelegate = networkMonitorWorkerDelegate
        self.commentAllWorkerDelegate = commentAllWorkerDelegate
        self.deviceFindAllUserDataWorkerDelegate = deviceFindAllUserDataWorkerDelegate
        self.deviceFindAllCommentsDataWorkerDelegate = deviceFindAllCommentsDataWorkerDelegate
        self.deviceSaveAllDataWorkerDelegate = deviceSaveAllDataWorkerDelegate
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
                        
                        self?.deviceDeletionAllDataWorkerDelegate.deleteAllData(entityName: "BackupGeo") { [weak self] (result) in
                            
                            self?.deviceDeletionAllDataWorkerDelegate.deleteAllData(entityName: "BackupAddress") { [weak self] (result) in
                                
                                self?.deviceDeletionAllDataWorkerDelegate.deleteAllData(entityName: "BackupCompany") { [weak self] (result) in
                                    
                                    self?.deviceDeletionAllDataWorkerDelegate.deleteAllData(entityName: "BackupComments") { [weak self] (result) in
                                        
                                        self?.deviceDeletionAllDataWorkerDelegate.deleteAllData(entityName: "BackupUser") { [weak self] (result) in
                                            
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
        
            self.networkMonitorWorkerDelegate.startMonitoring { [weak self] (state) in
                guard let self = self else { return }
                
                if ConnectionState.connected == state {
                    
                } else {
                    var posts: [Post] = []
                    posts.append(request.post)

                    DispatchQueue.main.async {
                        self.deviceSaveAllDataWorkerDelegate.createAllData(posts: posts)  { (result) in
                            
                        } fail: { (message) in
                            
                        }
                    }
                }
                
            } fail: { (message) in
                
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
