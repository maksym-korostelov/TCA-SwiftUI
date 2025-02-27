//
//  TCA_SwiftUIApp.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAExampleApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(
                store: Store(
                    initialState: UserListState(),
                    reducer: userListReducer,
                    environment: UserListEnvironment.live
                )
            )
        }
    }
}
