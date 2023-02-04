//
//  DeviceSaveAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceSaveAllCommentsDataWorker: DeviceSaveAllCommentsDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceSaveAllCommentsDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceSaveAllCommentsDataServiceDatasource = DeviceSaveAllCommentsDataService()) {
        self.service = service
    }
    
    func createData(comments: [Comment], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.createAllData(comments: comments) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
