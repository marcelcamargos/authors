//
//  CommentWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class CommentWorker: CommentWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: CommentServiceDatasource
    
    // MARK: - Init

    init(_ service: CommentServiceDatasource = CommentService()) {
        self.service = service
    }
    
    func getComments(postId: Int32, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        service.getComments(postId: postId) { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
