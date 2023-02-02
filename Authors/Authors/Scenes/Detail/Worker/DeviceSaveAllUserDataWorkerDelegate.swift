//
//  DeviceSaveAllUserDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceSaveAllUserDataWorkerDelegate {
    func createData(users: [User], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
