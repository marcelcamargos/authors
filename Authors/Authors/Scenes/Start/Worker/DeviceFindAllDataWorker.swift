//
//  DeviceFindAllDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

class DeviceFindAllDataWorker: DeviceFindAllDataWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: DeviceFindAllDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceFindAllDataServiceDatasource = DeviceFindAllDataService()) {
        self.service = service
    }

    func findFavourites(entityName: String, success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
        service.findFavourites(entityName: entityName) { (items) in
            success(items)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
