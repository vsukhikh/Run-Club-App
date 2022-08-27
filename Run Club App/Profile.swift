//
//  Profile.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-26.
//

import Foundation

enum ProfilePicker: String, CaseIterable, Identifiable {
    case workouts, posts
    var id: Self { self }
}

