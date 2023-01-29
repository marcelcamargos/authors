//
//  DetailWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol DetailWorkerDelegate {
    func getDetail(success: @escaping ([User]) -> (), fail:@escaping (String) -> ())
}
