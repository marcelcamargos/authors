//
//  DeviceFindAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class DeviceFindAllCommentsDataWorker: DeviceFindAllCommentsDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceFindAllCommentsDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceFindAllCommentsDataServiceDatasource = DeviceFindAllCommentsDataService()) {
        self.service = service
    }

    func findAllCommentsData(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        service.findAllComments(post: post) { (comments) in
            success(comments)
        } fail: { (message) in
            fail(message)
        }
    }
}
