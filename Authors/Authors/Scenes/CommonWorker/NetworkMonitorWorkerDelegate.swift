//
//  NetworkMonitorWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol NetworkMonitorWorkerDelegate {
    func startMonitoring(success: @escaping (ConnectionState) -> (), fail:@escaping (String) -> ())
}
