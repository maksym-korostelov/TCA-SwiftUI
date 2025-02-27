//
//  UserDetailAction.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


enum UserDetailAction: Equatable {
    case nameChanged(String)
    case saveButtonTapped
    case didFinish
    case updateUser(User)
}