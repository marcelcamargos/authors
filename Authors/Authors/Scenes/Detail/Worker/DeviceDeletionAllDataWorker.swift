//
//  DeviceDeletionAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllDataWorker: DeviceDeletionAllDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceDeletionAllDataServiceProtocol
    
    // MARK: - Init

    init(_ service: DeviceDeletionAllDataServiceProtocol = DeviceDeletionAllDataService()) {
        self.service = service
    }
    
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.deleteAllData(entityName: entityName) { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
