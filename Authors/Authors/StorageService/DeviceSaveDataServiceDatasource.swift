//
//  DeviceSaveDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

protocol DeviceSaveDataServiceDatasource: AnyObject {
    func createData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
