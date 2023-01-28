//
//  ViewCodable.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

public protocol ViewCodable {

    func buildHierarchy()

    func setupConstraints()

    func applyAdditionalChanges()
}

public extension ViewCodable {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}
