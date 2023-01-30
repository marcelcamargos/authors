//
//  DeviceSavingData.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

class DeviceSaveDataWorker: DeviceSaveDataWorkerDelegate {
    func createData(post: Post, favourite: Bool, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
        let saveService = DeviceSaveDataService()
        let updateService = DeviceUpdateDataService()
        let deviceFindDataService = DeviceFindDataService()
        if !deviceFindDataService.findByPost(post: post) {
            saveService.createData(post: post, favourite: favourite) { (result) in
                success(result)
            } fail: { (message) in
                fail(message)
            }
        }
    }
}
