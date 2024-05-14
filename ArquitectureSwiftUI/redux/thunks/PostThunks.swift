//
//  PostThunks.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Firebase

class PostThunks {
    
    var useCase: RetrievePostsUseCaseProtocol
    
    init(useCase: RetrievePostsUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func fetchThunk() -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            
            dispatch(FetchAction())
            
            Task {
                do {
                    let posts = try await self.useCase.fetchAsyncData()
                    print("posts", posts)
                    dispatch(PostsAction(list: posts))
                } catch {
                    print("Error fetching documents: \(error)")
                }
            }
            
        }
    }
}
