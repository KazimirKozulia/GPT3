//
//  MainButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 22.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct MainButton {
    
    @ObservableState
    struct State: Equatable {
        var buttonText: String
        var isLoading: Bool = false // Добавить проперти с булевым значением
        
    }
    
    enum Action {
        case buttonTapped
        case updateLoadingState(Bool) // Добавить Action, который примет переменную bool (для последующего изменения значения переменной isLoading)
    }
    
    var body: some ReducerOf<MainButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            case let .updateLoadingState(loading): // Записать в фукцию reduce обработку экшена updateLoadingState, для записи в нее константы loading
                state.isLoading = loading // обращение к State и записи новой константы в переменную isLoading
            return .none
            }
        }
    }
}

struct MainButtonView: View {
    let store: StoreOf<MainButton>
    var body: some View {
            Button(action:{
                store.send(.buttonTapped) // При нажатии на кнопку отправить экшен
            }, label:{
                if store.isLoading { //Если isLoading - тру, вызвать ProgressView()(Иконка загрузки, если фолс, то все после else)
                    ProgressView()
                } else {
                    Text(store.buttonText)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .background(Color.cyan)
                        .foregroundStyle(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5.0, x:0, y:5)
                    
                }
            })
    }
}

