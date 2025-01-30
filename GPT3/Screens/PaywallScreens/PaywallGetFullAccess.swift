////
////  PaywallGetFullAccess.swift
////  GPT3
////
////  Created by Kazimir Kozulia on 20.01.2025.
////
//
//import SwiftUI
//
//struct PaywallGetFullAccess: View {
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
//                Text("Get Full Access")
//                    .font(.system(size: 32, weight: .bold))
//                    .multilineTextAlignment(.center)
//                    .frame(width: 300, height: 100)
//                    .foregroundStyle(.mainText)
//                
//                Text("Ulimited Usage \n Ads free expiriens \n Higher word counts \n Adwanced AI model")
//                    .multilineTextAlignment(.center)
//                    .foregroundStyle(.mainText)
//
//                
//                Image(.manInSpaceship)
//                    .frame(width: 375, height: 375)
//                //                    .padding(.top, 296)
//                    .padding(.leading, 9)
//                
//                Text("Try 3 days for free, then $0.99/Week\nCancel anytime")
//                    .multilineTextAlignment(.center)
//                    .foregroundStyle(.gray)
//                
//                NavigationLink {
//                    PaywallSaleScreen()
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
//    PaywallGetFullAccess()
//}
