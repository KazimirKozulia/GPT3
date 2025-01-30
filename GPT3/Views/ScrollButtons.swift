//
//  ScrollButtons.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct ScrollButtons {
    
    @ObservableState
    struct State: Equatable {
        var topButtonsText: Text 
        var buttonsText: Text
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<ScrollButtons> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct ScrollButtonsView: View {
    let store: StoreOf<ScrollButtons>
    var body: some View {
        Button(action:{
            
        }, label:{
            Text("\(store.topButtonsText.foregroundStyle(.mainText)) \n \(store.buttonsText.foregroundStyle(.backButtonSetting))")
            
                .frame(width: 120, height: 45)
                .padding()
                .background(Color.backgroundScrollButtons)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )


            //                .overlay(
            //                    Capsule(style: .continuous)
            //                        .stroke(Color.white, style: StrokeStyle(lineWidth: 1))
            //                )
                        
            //                .cornerRadius(20)
            //                .border(Color.white, width: 1)
                





        })
        
        
    }
}

//struct ListScrollButtonsView {
//    var a: [ScrollButtons.State] = [ScrollButtons.State(topButtonsText: Text("Tell me a"),  buttonsText: Text("joke")), ScrollButtons.State(topButtonsText: Text("Give me"), buttonsText: Text("recipe")), ScrollButtons.State(topButtonsText: Text("Write a"), buttonsText: Text("code"))]
//    
//}

//@Reducer
//struct ListScrollButtons {
//    
//    @ObservableState
//    struct State: Equatable {
//        var firstButton = ScrollButtons.State(topButtonsText: "faf", buttonsText: "rwr")
//        var secondButton = ScrollButtons.State(topButtonsText: "kxnv", buttonsText: "akwdnwka")
//        var thirdButton = ScrollButtons.State(topButtonsText: "iAEWJdkndklwa", buttonsText: "oeafoajfajnf")
//    }
//    
//    enum Action {
//        case buttonTapped
//    }
//    
//    var body: some ReducerOf<ListScrollButtons> {
//        Reduce { state, action in
//            switch action {
//            case .buttonTapped:
//            return .none
//            }
//        }
//    }
//}
//
//struct ListScrollButtonsView {
//    let store: StoreOf<ListScrollButtons>
//}
