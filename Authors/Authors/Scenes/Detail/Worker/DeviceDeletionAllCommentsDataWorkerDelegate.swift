//
//  DeviceDeletionAllCommentsDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllCommentsDataWorkerDelegate: AnyObject {
    func deleteAllCommentsData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
