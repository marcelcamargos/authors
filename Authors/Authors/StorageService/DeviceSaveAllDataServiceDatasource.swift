//
//  DeviceSaveAllDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceSaveAllDataServiceDatasource: AnyObject {
    func createAllData(posts: [Post], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
