//
//  DeviceSavingData.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

class DeviceSaveDataWorker: DeviceSaveDataWorkerDelegate {
    func createData(post: Post, favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let saveService = DeviceSaveDataService()
        let updateService = DeviceUpdateDataService()
        let deviceFindDataService = DeviceFindDataService()
        
        if deviceFindDataService.findByPost(post: post) == false {
            saveService.createData(post: post, favourite: favourite) { (result) in
                success(result)
            } fail: { (message) in
                fail(message)
            }
        } else {
            updateService.updateData(post: post, favourite: favourite) { [weak self] (result) in
                guard let _ = self else { return }
                success(result)
            } fail: { (message) in
                fail(message)
            }
        }
    }
}
