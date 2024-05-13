//
//  RetrievePostsUseCase.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import Foundation
import Firebase
import FirebaseFirestoreInternal

class RetrievePostsUseCase: RetrievePostsUseCaseProtocol {
    
    var db: Firestore
    
    init(db: Firestore) {
        self.db = db
    }
    
    func fetchAsyncData() async throws -> [Post] {
      
        let collection = db.collection("Posts")
        let snapShoot = try await collection.getDocuments()
        let posts = (snapShoot.documents.map{Post(snapshot: $0)})
        
        return posts
        
    }
}
