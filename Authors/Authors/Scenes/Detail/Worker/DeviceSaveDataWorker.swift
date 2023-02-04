//
//  DeviceSavingData.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

class DeviceSaveDataWorker: DeviceSaveDataWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: DeviceSaveDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceSaveDataServiceDatasource = DeviceSaveDataService()) {
        self.service = service
    }
    
    func createData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.createData(post: post) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
