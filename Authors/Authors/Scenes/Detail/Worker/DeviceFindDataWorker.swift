//
//  DeviceFindDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

class DeviceFindDataWorker: DeviceFindDataWorkerDelegate {
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceFindDataService()
        service.findByPost(post: post) { (favourite) in
            success(favourite)
        } fail: { (message) in
            fail(message)
        }
    }
}
