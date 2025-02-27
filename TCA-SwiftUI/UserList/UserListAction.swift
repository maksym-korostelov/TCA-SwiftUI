//
//  UserListAction.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


/// Actions for the UserList feature.
enum UserListAction: Equatable {
    case onAppear
    case usersResponse(Result<[User], UserListError>)
    case userTapped(User)
    case userDetail(UserDetailAction)
}

/// Errors that can occur in UserList.
enum UserListError: Error, Equatable {
    case failedFetchingUsers
}