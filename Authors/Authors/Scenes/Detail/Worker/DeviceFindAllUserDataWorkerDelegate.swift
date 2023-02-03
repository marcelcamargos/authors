//
//  DeviceFindAllUserDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

protocol DeviceFindAllUserDataWorkerDelegate {
    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ())
}
