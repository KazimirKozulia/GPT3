//
//  MainScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 21.01.2025.


import SwiftUI
import ComposableArchitecture

@Reducer
struct Main {
    
    @ObservableState
    struct State: Equatable {
        var settingButton = SettingButton.State()
        var scrollButtons: IdentifiedArrayOf<ScrollButtons.State> = []
    }
    
    enum Action {
        case settingButton(SettingButton.Action)
        case scrollButtons(IdentifiedActionOf<ScrollButtons>)
        case onAppear
    }
    
    var body: some ReducerOf<Main> {
        Reduce { state, action in
            switch action {
            case .settingButton:
                return .none
            case .scrollButtons:
                return .none
            case .onAppear:
                let buttons = [
                    (Localizable.First.Scroll.Button.title, Localizable.First.Scroll.Button.subtitle),
                    (Localizable.Second.Scroll.Button.title, Localizable.Second.Scroll.Button.subtitle),
                    (Localizable.Third.Scroll.Button.title, Localizable.Third.Scroll.Button.subtitle),
                    (Localizable.Fourth.Scroll.Button.title, Localizable.Fourth.Scroll.Button.subtitle),
                    (Localizable.Fifth.Scroll.Button.title, Localizable.Fifth.Scroll.Button.subtitle),
                    (Localizable.Sixth.Scroll.Button.title, Localizable.Sixth.Scroll.Button.subtitle),
                    (Localizable.Seventh.Scroll.Button.title, Localizable.Seventh.Scroll.Button.subtitle),
                    (Localizable.Eighth.Scroll.Button.title, Localizable.Eighth.Scroll.Button.subtitle),
                    (Localizable.Ninth.Scroll.Button.title, Localizable.Ninth.Scroll.Button.subtitle)
                ]
                state.scrollButtons = IdentifiedArray(uniqueElements: buttons.map{
                    ScrollButtons.State(id: UUID(), topButtonsText: "\($0.0)", buttonsText: "\($0.1)")
                })
                return .none
            }
        }
        .forEach(\.scrollButtons, action: \.scrollButtons) {
            ScrollButtons()
        }
    }
}

struct MainScreen: View {
    let store: StoreOf<Main>
    var body: some View {
        VStack{
            HStack{
                SettingButtonView(store: store.scope(state: \.settingButton, action: \.settingButton))

                Spacer()
                
                Text(Localizable.MainScreen.Main.title)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 20))
                    .foregroundStyle(.mainText)
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(.saleIcon)
                }
                
            } .padding(.horizontal, 20)
            
            Spacer()
            
            Text(Localizable.MainScreen.title)
                .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                .foregroundStyle(.indigo)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(store.scope(state:\.scrollButtons, action:\.scrollButtons)){ childStore in
                        ScrollButtonsView(store: childStore)
//                            .contentShape(Rectangle())
//                            .allowsHitTesting(true)
                    }
                }              .padding(.horizontal, 20)
                
                
            }
            
            Spacer()
            
            Image(.mainScreenAI)
            
            Spacer()
            
        } .onAppear {
            store.send(.onAppear)
        }
//        .containerRelativeFrame([.horizontal, .vertical])
            .background(.mainBackground)
    }
}

#Preview {
    MainScreen(
        store: StoreOf<Main>(
            initialState: Main.State(),
            reducer: { Main() }
        )
    )
}


