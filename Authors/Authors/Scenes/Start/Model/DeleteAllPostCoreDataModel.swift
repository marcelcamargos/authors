//
//  DeleteAllPostCoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

enum DeleteAllPostCoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {

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
