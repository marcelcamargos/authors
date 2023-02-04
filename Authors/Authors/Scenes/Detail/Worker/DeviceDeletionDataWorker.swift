//
//  DeviceDeletionDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

class DeviceDeletionDataWorker: DeviceDeletionDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceDeletionDataServiceProtocol
    
    // MARK: - Init

    init(_ service: DeviceDeletionDataServiceProtocol = DeviceDeletionDataService()) {
        self.service = service
    }
    
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.deleteData(post: post) { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
