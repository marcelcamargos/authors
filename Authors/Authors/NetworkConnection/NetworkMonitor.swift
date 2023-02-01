//
//  NetworkMonitor.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Network

enum ConnectionState {
    case connected
    case notConnected
}

protocol NetworkMonitorDelegate {
    func startMonitoring(success: @escaping (ConnectionState) -> (), fail: @escaping (String) -> ())
    func stopMonitoring()
}

class NetworkMonitor: NetworkMonitorDelegate {
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true

    func startMonitoring(success: @escaping (ConnectionState) -> (), fail: @escaping (String) -> ()) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                success(ConnectionState.connected)
            } else {
                success(ConnectionState.notConnected)
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
