//
//  DetailViewControllerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol DetailViewControllerDelegate: AnyObject {
    func presenter(didSuccessShowDetail presenterToView: DetailModel.ViewModel)
    func presenter(didFailShowDetail message: String)
}
