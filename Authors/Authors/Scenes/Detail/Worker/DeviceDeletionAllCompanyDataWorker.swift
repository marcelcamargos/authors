//
//  DeviceDeletionAllCompanyDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllCompanyDataWorker: DeviceDeletionAllCompanyDataWorkerDelegate {
    func deleteAllCompanyData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllAddressDataService()
        service.deleteAllAddressData() { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
