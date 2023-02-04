//
//  DeviceDeletionAllCommentsDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllDataWorkerDelegate: AnyObject {
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
