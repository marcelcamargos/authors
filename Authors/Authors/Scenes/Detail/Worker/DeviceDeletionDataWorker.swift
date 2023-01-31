//
//  DeviceDeletionDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

class DeviceDeletionDataWorker: DeviceDeletionDataWorkerDelegate {
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionDataService()
        service.deleteData(post: post) { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
