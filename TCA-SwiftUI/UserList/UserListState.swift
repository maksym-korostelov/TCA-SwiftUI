//
//  UserListState.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


import ComposableArchitecture

/// State for the UserList feature.
struct UserListState: Equatable {
    var users: [User] = []
    var userDetailState: UserDetailState?
}