//
//  PostWorkerDelegate1.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostWorkerDelegate {
    func getPostList(success: @escaping ([Post]) -> (), fail:@escaping (String) -> ())
}
