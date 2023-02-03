//
//  DetailCoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

enum DetailCoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        let users: [User]
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let result: Bool
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let result: Bool
    }
}
