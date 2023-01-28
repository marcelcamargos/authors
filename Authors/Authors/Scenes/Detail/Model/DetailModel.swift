//
//  DetailModel.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

enum DetailModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        var detail: Detail
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let title: String
        let shortDescription: String
        let longDescription: String
    }
}
