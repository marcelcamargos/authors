//
//  DeviceSaveAllUserDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceSaveAllUserDataServiceDatasource: AnyObject {
    func createAllData(users: [User], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
