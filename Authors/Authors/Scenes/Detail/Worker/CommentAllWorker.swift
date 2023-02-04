//
//  CommentAllWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class CommentAllWorker: CommentAllWorkerDelegate {
    // MARK: - Private Properties

    private var service: CommentAllServiceDatasource
    
    // MARK: - Init

    init(_ service: CommentAllServiceDatasource = CommentAllService()) {
        self.service = service
    }

    func getAllComments(success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        service.getAllComments() { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
