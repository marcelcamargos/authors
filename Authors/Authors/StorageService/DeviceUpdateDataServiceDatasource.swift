//
//  DeviceUpdateDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceUpdateDataServiceDatasource {
    func updateData(post: Post, favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
