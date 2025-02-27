//
//  UserDetailState.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


import ComposableArchitecture

struct UserDetailState: Equatable {
    var user: User
    var editedName: String

    init(user: User) {
        self.user = user
        self.editedName = user.name
    }
}