//
//  Step.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}
