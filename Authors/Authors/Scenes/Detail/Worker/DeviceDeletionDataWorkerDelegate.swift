//
//  DeviceDeletionDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

protocol DeviceDeletionDataWorkerDelegate: AnyObject {
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
