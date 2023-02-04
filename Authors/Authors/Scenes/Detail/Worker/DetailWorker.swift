//
//  DetailWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class DetailWorker: DetailWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: UserServiceDatasource
    
    // MARK: - Init

    init(_ service: UserServiceDatasource = UserService()) {
        self.service = service
    }
    
    func getDetail(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        service.getDetail { (users) in
            success(users)
        } fail: { (message) in
            fail(message)
        }
    }
}
