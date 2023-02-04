//
//  URLSessionProtocol.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}
