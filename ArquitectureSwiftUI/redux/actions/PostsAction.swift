//
//  PostsAction.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//


import ReSwift
import SwiftUI

struct PostsAction<T>: Action {
    var list: [T]
}

struct FetchAction: Action {}
