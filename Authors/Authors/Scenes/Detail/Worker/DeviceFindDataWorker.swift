//
//  DeviceFindDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

class DeviceFindDataWorker: DeviceFindDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceFindDataServiceDatasource
    
    // MARK: - Init

    init(_ service: DeviceFindDataServiceDatasource = DeviceFindDataService()) {
        self.service = service
    }
    
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        service.findByPost(post: post) { (favourite) in
            success(favourite)
        } fail: { (message) in
            fail(message)
        }
    }
}
