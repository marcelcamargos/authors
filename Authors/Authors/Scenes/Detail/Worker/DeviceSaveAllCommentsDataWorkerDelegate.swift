//
//  DeviceSaveAllCommentsDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceSaveAllCommentsDataWorkerDelegate: AnyObject {
    func createData(comments: [Comment], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
