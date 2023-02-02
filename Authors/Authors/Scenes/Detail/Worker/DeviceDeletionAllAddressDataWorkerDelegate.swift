//
//  DeviceDeletionAllAddressDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllAddressDataWorkerDelegate: AnyObject {
    func deleteAllAddressData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
