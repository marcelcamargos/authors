//
//  DetailWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class DetailWorker: DetailWorkerDelegate {
    
    func getDetail(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        let service = UserService()
        service.getDetail { (users) in
            success(users)
        } fail: { (message) in
            fail(message)
        }
    }
}
