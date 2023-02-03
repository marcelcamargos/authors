//
//  PostDeletionWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class PostDeletionWorker: PostDeletionWorkerDelegate {
    
    func deletePost(postId: Int32, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
        let service = PostDeletionService()
        service.processDeletion(postId: postId) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
