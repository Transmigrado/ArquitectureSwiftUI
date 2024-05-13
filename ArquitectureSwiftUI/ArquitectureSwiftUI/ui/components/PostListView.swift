//
//  PostListView.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import SwiftUI

struct PostListView: View {
    
    var posts: [Post]
    
    var body: some View {
        List(posts){
            Text($0.message!)
        }
    }
}


