//
//  NetworkMonitorWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

class NetworkMonitorWorker: NetworkMonitorWorkerDelegate {
    
    func startMonitoring(success: @escaping (ConnectionState) -> (), fail:@escaping (String) -> ()) {
        let service = NetworkMonitor()
        
        service.startMonitoring { (state) in
            success(state)
            service.stopMonitoring()
        } fail: { (message) in
            fail(message)
            service.stopMonitoring()
        }
    }
}
