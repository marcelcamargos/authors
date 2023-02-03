//
//  DeviceSaveAllDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol DeviceSaveAllDataWorkerDelegate {
    func createAllData(posts: [Post], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
