//
//  DeviceDeletionAllGeoDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

protocol DeviceDeletionAllGeoDataWorkerDelegate: AnyObject {
    func deleteAllGeoData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
