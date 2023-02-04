//
//  DeviceSaveAllCommentsDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceSaveAllCommentsDataServiceDatasource: AnyObject {
    func createAllData(comments: [Comment], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
