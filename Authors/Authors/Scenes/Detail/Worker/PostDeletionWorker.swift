//
//  PostDeletionWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class PostDeletionWorker: PostDeletionWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: PostDeletionServiceDatasource
    
    // MARK: - Init

    init(_ service: PostDeletionServiceDatasource = PostDeletionService()) {
        self.service = service
    }
    
    func deletePost(postId: Int32, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
        service.processDeletion(postId: postId) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
