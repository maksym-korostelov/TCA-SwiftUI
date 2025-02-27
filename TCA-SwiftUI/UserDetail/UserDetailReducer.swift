import ComposableArchitecture

let userDetailReducer = Reducer<
    UserDetailState,
    UserDetailAction,
    UserDetailEnvironment
> { state, action, environment in
    switch action {
    case let .nameChanged(name):
        state.editedName = name
        return .none
        
    case .saveButtonTapped:
        let updatedUser = User(id: state.user.id, name: state.editedName)
        return Effect(value: .updateUser(updatedUser))
        
    case .updateUser:
        return Effect(value: .didFinish)
        
    case .didFinish:
        return .none
    }
}