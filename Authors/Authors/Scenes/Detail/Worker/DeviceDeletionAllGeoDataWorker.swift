//
//  DeviceDeletionAllGeoDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllGeoDataWorker: DeviceDeletionAllGeoDataWorkerDelegate {
    func deleteAllGeoData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllGeoDataService()
        service.deleteAllGeoData() { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
