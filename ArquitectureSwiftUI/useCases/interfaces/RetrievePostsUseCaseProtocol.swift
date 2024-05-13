//
//  RetrievePostsUseCase.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import Foundation

protocol RetrievePostsUseCaseProtocol {
    func fetchAsyncData() async throws -> [Post]
}
