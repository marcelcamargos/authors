//
//  DeviceSaveDataDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

protocol DeviceSaveDataWorkerDelegate {
    func createData(post: Post, favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
