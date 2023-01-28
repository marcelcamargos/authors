//
//  PostViewDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostViewDelegate: AnyObject {
    func didClickItem(selectedPost: Post)
}
