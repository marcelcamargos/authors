//
//  DeviceFindAllDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

class DeviceFindAllDataWorker: DeviceFindAllDataWorkerDelegate {
    
    func findFavourites(success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceFindAllDataService()
        
        service.findFavourites { (items) in
            success(items)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
