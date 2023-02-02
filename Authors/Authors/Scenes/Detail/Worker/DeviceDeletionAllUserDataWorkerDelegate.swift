//
//  DeviceDeletionAllUserDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllUserDataWorkerDelegate: AnyObject {
    func deleteAllUserData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
