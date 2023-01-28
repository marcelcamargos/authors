//
//  PostWorkerDelegate1.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostWorkerDelegate1 {
    func getItemsList(success: @escaping ([String]) -> (), fail:@escaping (String) -> ())
}
