//
//  postsReducer.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import Foundation
import ReSwift



struct PostsState: Identifiable, Equatable {
    static func == (lhs: PostsState, rhs: PostsState) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var list: [Post] = []
    var isLoading = false
}

func postsReducer(action: Action, state: AppState?) -> AppState {
   
    var state = state ?? AppState()

    switch action {
        case _ as FetchAction:
            state.posts.isLoading = true
        case let item as PostsAction<Post>:
            state.posts.list = item.list
            state.posts.isLoading = false
        default: break
    }
    
    return state
}
