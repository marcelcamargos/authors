//
//  DeviceDeleteAllDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol DeviceDeleteAllDataWorkerDelegate {
    func deleteAllData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
