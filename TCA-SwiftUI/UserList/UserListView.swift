//
//  UserListView.swift
//  TCA-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


import SwiftUI
import ComposableArchitecture

struct UserListView: View {
    let store: Store<UserListState, UserListAction>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                List {
                    ForEach(viewStore.users) { user in
                        Button(action: {
                            viewStore.send(.userTapped(user))
                        }) {
                            Text(user.name)
                        }
                    }
                }
                .navigationTitle("Users")
                .onAppear {
                    viewStore.send(.onAppear)
                }
                .sheet(
                    isPresented: Binding(
                        get: { viewStore.userDetailState != nil },
                        set: { _ in viewStore.send(.userDetail(.didFinish)) }
                    ),
                    content: {
                        IfLetStore(
                            self.store.scope(
                                state: \.userDetailState,
                                action: UserListAction.userDetail
                            ),
                            then: UserDetailView.init(store:)
                        )
                    }
                )
            }
        }
    }
}