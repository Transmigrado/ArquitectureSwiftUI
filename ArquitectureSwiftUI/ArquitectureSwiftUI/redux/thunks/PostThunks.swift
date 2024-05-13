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

func fetchThunk(useCase: RetrievePostsUseCaseProtocol) -> Thunk<AppState>{
    return Thunk<AppState> { dispatch, getState in
        
        dispatch(FetchAction())
        
        Task {
            do {
                let posts = try await useCase.fetchAsyncData()
                dispatch(PostsAction(list: posts))
            } catch {
                print("Error fetching documents: \(error)")
            }
        }
        
    }
}
