//
//  DeviceFindAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class DeviceFindAllCommentsDataWorker: DeviceFindAllCommentsDataWorkerDelegate {
    
    func findAllCommentsData(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceFindAllCommentsDataService()
        service.findAllComments(post: post) { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
