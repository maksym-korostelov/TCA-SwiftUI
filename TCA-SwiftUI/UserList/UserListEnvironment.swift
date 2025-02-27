//
//  UserListEnvironment.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//

import Combine
import ComposableArchitecture

struct UserListEnvironment {
    var fetchUsers: () -> Effect<[User], UserListError>
}

extension UserListEnvironment {
    static let live = UserListEnvironment(fetchUsers: {
        Effect.future { callback in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                let users = [
                    User(id: 1, name: "Alice"),
                    User(id: 2, name: "Bob"),
                    User(id: 3, name: "Charlie")
                ]
                callback(.success(users))
            }
        }
    })
}
