//
//  FinalView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/19.
//

import SwiftUI



struct FinalView: View {
    let isLight: Bool
    
    @Binding var moveToFirst: Bool
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.9)
                .ignoresSafeArea()
            VStack {
                if isLight {
                    HStack {
                        Text("Certification of Light Combination")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                        
                        Image(systemName: "lightbulb.fill")
                            .imageScale(.large)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Congratulations!")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                    Text("Got a light combination master license!")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                        .padding()
                    Text("Now you can combine lights freely and use them to do creative activities.")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                    Text("If you want to play the color version, \nPress the button below.")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                        .padding()
                    Spacer()
                    Text("Special hint!\nIf you're going back to the first screen, \ntap everything that looks like you can press it!\n You may find something hidden...")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                            .padding()
                    Button {
                        NavigationUtil.popToRootView()
                        NavigationLink(destination: ContentView()) {
                            EmptyView()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(.white)
                            .overlay(
                                Text("New!")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            )
                    }
                    .frame(width: 100, height: 50)
                }
                else {
                    HStack {
                        Text("Certification of Color Combination")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                        
                        Image(systemName: "paintbrush.fill")
                            .imageScale(.large)
                            .font(.system(size: 30))
                            .foregroundColor(.green)
                    }
                    Spacer()
                    Text("Congratulations!")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(Color(UIColor.magenta))
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                    Text("Got a color combination master license!")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.cyan)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                        .padding()
                    Text("Now you can combine colors freely and use them to do creative activities.")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                    Text("If you want to play the light version, \nPress the button below.")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                        .transition(.slide)
                        .padding()
                    Spacer()
                    Text("Special hint!\nIf you're going back to the first screen, \ntap everything that looks like you can press it!\n You may find something hidden...")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                            .padding()
                    Button {
                        NavigationUtil.popToRootView()
                        NavigationLink(destination: ContentView()) {
                            EmptyView()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(.black)
                            .overlay(
                                Text("New!")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            )
                    }
                    .frame(width: 100, height: 50)
                    
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(isLight: false, moveToFirst: .constant(false))
    }
}
