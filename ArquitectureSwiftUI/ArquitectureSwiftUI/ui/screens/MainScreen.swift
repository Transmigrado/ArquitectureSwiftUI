//
//  MainScreen.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import SwiftUI
import FirebaseFirestoreInternal

struct MainScreen: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        ZStack{
            if(store.state.posts.isLoading){
                Text("Cargando")
            } else {
                PostListView(posts: store.state.posts.list)
            }
        }
        .onAppear{
            let useCase =  RetrievePostsUseCase(db: Firestore.firestore())
            store.dispatch(fetchThunk(useCase: useCase))
        }
    }
}

#Preview {
    MainScreen()
}
