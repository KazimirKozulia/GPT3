////
////  PaywallSaleScreen.swift
////  GPT3
////
////  Created by Kazimir Kozulia on 21.01.2025.
////
//
//import SwiftUI
//
//struct PaywallSaleScreen: View {
//    
//    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//    
//    var body: some View {
//            VStack{
//                
//                Spacer()
//                    .navigationBarBackButtonHidden(true)
//                    .toolbar(content: {
//                        ToolbarItem (placement: .navigationBarLeading) {
//                            
//                            Button(action: {
//                                presentationMode.wrappedValue.dismiss()
//                            }, label: {
//                                Image(.cross)
//                            })
//                        }
//                    })
//                
//                Text("Offer for you \n Get Full Access")
//                    .font(.system(size: 32, weight: .bold))
//                    .multilineTextAlignment(.center)
//                    .frame(width: 300, height: 100)
//                    .foregroundStyle(.mainText)
//                
//                Text("Get personalized responses, faster \n processing times, and enhanced \n performance. Try it out today!")
//                    .multilineTextAlignment(.center)
//                    .foregroundStyle(.mainText)
//
//                
//                Image(.saleLettering)
//                    .frame(width: 375, height: 375)
//                //                    .padding(.top, 296)
//                    .padding(.leading, 9)
//                
//                Text("Get all option $19.99/year")
//                    .foregroundStyle(.cyan)
//                                    
//                Text("Old price $49.99")
//                    .strikethrough(color: .mainText)
//                    .foregroundStyle(.mainText)
//                
//                Text("Until the end of the offer left")
//                    .foregroundStyle(.mainText)
//                
//                NavigationLink {
////                    MainScreen()
//                } label: {
//                    Text("CONTINUE")
//                        .frame(minWidth: 0, maxWidth: 300)
//                        .padding()
//                        .background(Color.cyan)
//                        .foregroundStyle(Color.white)
//                    //                    .border(.cyan, width: 5)
//                    //                    .font(.title)
//                        .cornerRadius(20)
//                        .shadow(color: .gray, radius: 5.0, x:0, y:5)
//                    
//                }
//                .navigationTitle("")
//                
//                HStack{
//                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Term of Servixe")
//                            .foregroundColor(.gray)
//                    })
//                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Restore")
//                            .foregroundColor(.gray)
//                    })
//                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Privacy Policy")
//                            .foregroundColor(.gray)
//                    })
//                }
//                .padding(40)
//            }
//            
//            .containerRelativeFrame([.horizontal, .vertical])
//            .background(.mainBackground)
//        }
//    }
//
//#Preview {
//    PaywallSaleScreen()
//}
