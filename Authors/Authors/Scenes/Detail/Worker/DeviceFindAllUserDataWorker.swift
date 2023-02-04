//
//  DeviceFindAllUserDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class DeviceFindAllUserDataWorker: DeviceFindAllUserDataWorkerDelegate {
    // MARK: - Private Properties

    private var service: DeviceFindAllUserDataServiceProtocol
    
    // MARK: - Init

    init(_ service: DeviceFindAllUserDataServiceProtocol = DeviceFindAllUserDataService()) {
        self.service = service
    }

    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        service.findAllUserData() { (users) in
            success(users)
        } fail: { (message) in
            fail(message)
        }
    }
}
