//
//  DetailWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class DetailWorker: DetailWorkerDelegate {
    
    func getDetail(success: @escaping (Detail) -> (), fail: @escaping (String) -> ()) {
        let service = DetailService()
        service.getDetail { (detail) in
            success(detail)
        } fail: { (message) in
            fail(message)
        }
    }
}
