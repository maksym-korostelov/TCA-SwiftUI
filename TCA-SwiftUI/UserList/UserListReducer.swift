import ComposableArchitecture

let userListReducer = Reducer<
    UserListState,
    UserListAction,
    UserListEnvironment
>.combine(
    userDetailReducer
        .optional()
        .pullback(
            state: \.userDetailState,
            action: /UserListAction.userDetail,
            environment: { _ in UserDetailEnvironment() }
        ),
    Reducer { state, action, environment in
        switch action {
        case .onAppear:
            return environment.fetchUsers()
                .receive(on: DispatchQueue.main)
                .catchToEffect(UserListAction.usersResponse)
            
        case let .usersResponse(.success(users)):
            state.users = users
            return .none
            
        case .usersResponse(.failure):
            state.users = []
            return .none
            
        case let .userTapped(user):
            state.userDetailState = UserDetailState(user: user)
            return .none
            
        case .userDetail(.didFinish):
            state.userDetailState = nil
            return .none
            
        case let .userDetail(.updateUser(updatedUser)):
            if let index = state.users.firstIndex(where: { $0.id == updatedUser.id }) {
                state.users[index] = updatedUser
            }
            return .none
            
        case .userDetail:
            return .none
        }
    }
)

