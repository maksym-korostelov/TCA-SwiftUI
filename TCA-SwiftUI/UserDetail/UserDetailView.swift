//
//  UserDetailView.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


import SwiftUI
import ComposableArchitecture

struct UserDetailView: View {
    let store: Store<UserDetailState, UserDetailAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                Form {
                    TextField(
                        "Name",
                        text: viewStore.binding(
                            get: \.editedName,
                            send: UserDetailAction.nameChanged
                        )
                    )
                    .autocapitalization(.words)
                }
                .navigationBarTitle("Edit User", displayMode: .inline)
                .navigationBarItems(
                    trailing: Button("Save") {
                        viewStore.send(.saveButtonTapped)
                    }
                )
            }
        }
    }
}