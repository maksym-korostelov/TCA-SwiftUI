//
//  User.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


import Foundation

/// User model representing a user entity.
struct User: Identifiable, Equatable {
    let id: Int
    var name: String
}