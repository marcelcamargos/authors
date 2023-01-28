//
//  DetailService.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol DetailServiceDelegate: AnyObject {
    func getDetail(success: @escaping (Detail) -> (), fail: @escaping (String) -> ())
}

class DetailService: DetailServiceDelegate {
    func getDetail(success: @escaping (Detail) -> (), fail: @escaping (String) -> ()) {
        let detail = Detail(title: "dolorum ut in voluptas mollitia et saepe quo animi", description: "aut dicta possimus sint mollitia voluptas commodi quo doloremque\niste corrupti reiciendis voluptatem eius rerum\nsit cumque quod eligendi laborum minima\nperferendis recusandae assumenda consectetur porro architecto ipsum ipsam")
        success(detail)
    }
}
