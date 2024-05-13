//
//  AppState.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import Foundation
import ReSwift
import SwiftUI


struct AppState: Equatable {
    var stateStatus = UUID()
    var posts = PostsState()
}
