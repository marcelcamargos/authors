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
    private var postWorker: PostWorkerDelegate
    private var deviceFindAllDataWorkerDelegate: DeviceFindAllDataWorkerDelegate
    private var deviceSaveAllDataWorkerDelegate: DeviceSaveAllDataWorkerDelegate
    private var deviceDeleteAllDataWorkerDelegate: DeviceDeleteAllDataWorkerDelegate
    private var networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: PostPresenterDelegate?, _ postWorker: PostWorkerDelegate = PostWorker(), _ deviceFindAllDataWorkerDelegate: DeviceFindAllDataWorkerDelegate = DeviceFindAllDataWorker(), _ deviceSaveAllDataWorkerDelegate: DeviceSaveAllDataWorkerDelegate = DeviceSaveAllDataWorker(), _ deviceDeleteAllDataWorkerDelegate: DeviceDeleteAllDataWorkerDelegate = DeviceDeleteAllDataWorker(), networkMonitorWorkerDelegate: NetworkMonitorWorkerDelegate = NetworkMonitorWorker()) {
        self.presenter = presenter
        self.postWorker = postWorker
        self.deviceFindAllDataWorkerDelegate = deviceFindAllDataWorkerDelegate
        self.deviceSaveAllDataWorkerDelegate = deviceSaveAllDataWorkerDelegate
        self.deviceDeleteAllDataWorkerDelegate = deviceDeleteAllDataWorkerDelegate
        self.networkMonitorWorkerDelegate = networkMonitorWorkerDelegate
    }
}

// MARK: - PostInteractor

extension PostInteractor: PostInteractorDelegate {
    func fetchPosts(uiViewController: UIViewController) {
        
        networkMonitorWorkerDelegate.startMonitoring { [weak self] (state) in
            guard let self = self else { return }
            
            if ConnectionState.connected == state {
                self.postWorker.getPostList { [weak self] (posts) in
                    guard let self = self else { return }

                    self.deviceFindAllDataWorkerDelegate.findFavourites(entityName: "Wishes") { [weak self] (items) in
                        guard let self = self else { return }
                        let interactorToPresenter = PostModel.Response(posts: posts, favourites: items)
                        self.presenter?.interactor(didSuccessShowPost: interactorToPresenter)
                        
                        self.deviceDeleteAllDataWorkerDelegate.deleteAllData() { [weak self] (deleted) in
                            guard let self = self else { return }
                            let response = DeleteAllPostCoreDataModel.Response(result: deleted)
                            self.presenter?.interactor(didSuccessDeleteAllCoreData: response)
                            
                            //antes de fazer esse save, primeiro limpe o conteudo dessa tabela.
                            let request = StartCoreDataModel.Request(posts: posts)
                            self.saveAllToCoreData(request: request)
                            
                        } fail: { [weak self] (message) in
                            self?.presenter?.interactor(didFailDeleteAllCoreData: message)
                        }
                        
                    } fail: { (message) in
                        //self?.presenter?.interactor(didFailShowPosts: message)
                    }
                    
                } fail: { (message) in
                    self.presenter?.interactor(didFailShowPost: message)
                }
            } else {
                self.deviceFindAllDataWorkerDelegate.findFavourites(entityName: "BackupPosts") { [weak self] (allPosts) in
                    guard let self = self else { return }

                    self.deviceFindAllDataWorkerDelegate.findFavourites(entityName: "Wishes") { [weak self] (favourites) in
                        guard let self = self else { return }
                        let interactorToPresenter = PostModel.Response(posts: allPosts, favourites: favourites)
                        self.presenter?.interactor(didSuccessShowPost: interactorToPresenter)
                        
                    } fail: { (message) in
                        //self?.presenter?.interactor(didFailShowPosts: message)
                    }
                    
                } fail: { (message) in
                    self.presenter?.interactor(didFailShowPost: message)
                }
            }
            
        } fail: { [weak self] (message) in
            
        }
    }
    
    func saveAllToCoreData(request: StartCoreDataModel.Request) {
        deviceSaveAllDataWorkerDelegate.createAllData(posts: request.posts) { [weak self] (result) in
            let response = StartCoreDataModel.Response(result: result)
            self?.presenter?.interactor(didSuccessSaveAllCoreData: response)
        } fail: { (message) in
            self.presenter?.interactor(didFailSaveAllCoreData: message)
        }
    }
    
    func deleteAllData(request: DeleteAllPostCoreDataModel.Request) {
        
    }
    
//    func tryConnect(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
//                success(posts)
//    }
}
