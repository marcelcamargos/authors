//
//  CommentWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class CommentWorker: CommentWorkerDelegate {
    
    func getComments(postId: Int32, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let service = CommentService()
        service.getComments(postId: postId) { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
