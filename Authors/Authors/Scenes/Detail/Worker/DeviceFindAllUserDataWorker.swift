//
//  DeviceFindAllUserDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class DeviceFindAllUserDataWorker: DeviceFindAllUserDataWorkerDelegate {
    
    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceFindAllUserDataService()
        service.findAllUserData() { (users) in
            success(users)
        } fail: { (message) in
            fail(message)
        }
    }
}
