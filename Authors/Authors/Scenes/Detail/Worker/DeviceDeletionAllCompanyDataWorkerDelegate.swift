//
//  DeviceDeletionAllCompanyDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllCompanyDataWorkerDelegate: AnyObject {
    func deleteAllCompanyData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
