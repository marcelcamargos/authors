//
//  DeviceSaveAllUserDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceSaveAllUserDataWorker: DeviceSaveAllUserDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceSaveAllUserDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceSaveAllUserDataServiceDatasource = DeviceSaveAllUserDataService()) {
        self.service = service
    }
    
    func createData(users: [User], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.createAllData(users: users) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
