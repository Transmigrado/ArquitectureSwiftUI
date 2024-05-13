//
//  CombineReducers.swift
//  ArquitectureSwiftUI
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//


import ReSwift
import Foundation

func combineReducers<T>(_ first: @escaping Reducer<T>, _ remainder: Reducer<T>...) -> Reducer<T> {
    return { action, state in
        let firstResult = first(action, state)
        let result = remainder.reduce(firstResult) { result, reducer in
            return reducer(action, result)
        }
        return result
    }
}
