//
//  Post.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//


import Foundation
import SwiftUI
import FirebaseFirestore


struct Post: Identifiable, Equatable {
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var uid: String?
    var message: String?
}


extension Post {
    init(snapshot: QueryDocumentSnapshot) {
  
        let snapshotValue = snapshot.data()
        uid = snapshotValue["uid"] as? String
        message = snapshotValue["message"] as? String
    }
}

