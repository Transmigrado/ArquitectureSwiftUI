//
//  ArquitectureSwiftUIApp.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import SwiftUI
import FirebaseCore
import ReSwift
import ReSwiftThunk


@main
struct ArquitectureSwiftUIApp: App {
    
   
    let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
    let store: AppStore?
    
    init(){
       
        let reducer = combineReducers(
            postsReducer
        )

        store = AppStore(reducer: reducer, state: AppState(), middleware: [thunkMiddleware])
        FirebaseApp.configure()
    }
        

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store!)
        }
    }
}
