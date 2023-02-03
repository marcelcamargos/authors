//
//  CommentAllWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class CommentAllWorker: CommentAllWorkerDelegate {
    
    func getAllComments(success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let service = CommentAllService()
        service.getAllComments() { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
