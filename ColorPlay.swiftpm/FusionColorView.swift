//
//  FusionColorView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/17.
//

import SwiftUI
import UIKit

struct FusionColorView : View {
    var textColor: Color
    let imageName: String
    let imageDict = ["lightbulb.fill" : "lightbulb", "paintbrush.fill" : "paintbrush"]
    var currentColor: Color
    var oppositeColor: Color
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    @State var redPoint: CGPoint?
    @State var bluePoint: CGPoint?
    @State var greenPoint: CGPoint?
    @State var dragAmount: CGPoint?
    
    @State private var isTappedLight = false
    @State private var isTappedPaint = false
    
    @State private var firstTapped = false
    @State private var lastTapped = false
    @State private var moveNext = false
    
    @Binding var moveToFirst: Bool
    var didTappedAny: Bool {if(isTappedLight || isTappedPaint){ return true} else {return false}}
    var lightColor: Color = .red
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("Which do you like better, light or color?")
                    .padding()
                    .foregroundColor(textColor)
                    .font(.system(size: 30, weight: .bold))
                HStack {
                    if !isTappedPaint {
                        Image(systemName: isTappedLight ? "lightbulb.fill" : imageDict["lightbulb.fill"]!)
                            .imageScale(.large)
                            .font(.system(size: 50))
                            .padding()
                            .foregroundColor(isTappedLight ? self.currentColor : self.oppositeColor)
                            .onTapGesture {
                                isTappedLight.toggle()
                                if isTappedPaint {
                                    isTappedPaint.toggle()
                                }
                                firstTapped = false
                                lastTapped = false
                            }
                            .animation(.easeIn, value: isTappedLight)
                    }
                    if !isTappedLight{
                        Image(systemName: isTappedPaint ? "paintbrush.fill" : imageDict["paintbrush.fill"]!)
                            .imageScale(.large)
                            .font(.system(size: 50))
                            .opacity(isTappedLight ? 0 : 1)
                            .padding()
                            .foregroundColor(isTappedPaint ? self.currentColor : self.oppositeColor)
                            .onTapGesture {
                                isTappedPaint.toggle()
                                if isTappedLight {
                                    isTappedLight.toggle()
                                }
                                firstTapped = false
                                lastTapped = false
                            }
                            .animation(.easeIn, value: isTappedPaint)
                    }
                }
                if (isTappedLight) {
                    VStack {
                        Text("You chose the Light!")
                            .padding()
                            .foregroundColor(textColor)
                            .font(.system(size: 30, weight: .bold))
                        Text("First of all, let's imagine the world without light.")
                            .padding(.bottom)
                            .foregroundColor(textColor)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: screenWidth - 150)
                        Text("If you're done with your imagination, please press the button below.")
                            .padding(.bottom)
                            .foregroundColor(textColor)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .opacity(isTappedLight ? 1 : 0)
                    .animation(.easeIn(duration: 1.5), value: isTappedLight)
                    Color.black
                        .frame(height: screenHeight/3)
                        .padding()
                        .opacity(firstTapped ? 1 : 0)
                        .animation(.easeIn(duration: 1.5), value: firstTapped)
                    
                    Text("That's right! A world without light,\n it'll be all black in the dark.")
                        .padding(.bottom)
                        .foregroundColor(textColor)
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: screenWidth - 150)
                        .multilineTextAlignment(.center)
                        .opacity(lastTapped ? 1 : 0)
                        .animation(.easeIn(duration: 1.5), value: lastTapped)
                } else {
                    VStack {
                        Text("You chose the Paint!")
                            .padding()
                            .foregroundColor(textColor)
                            .font(.system(size: 30, weight: .bold))
                        Text("First of all, let's imagine the Canvas without the color.")
                            .padding(.bottom)
                            .foregroundColor(textColor)
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: screenWidth - 150)
                        Text("If you're done with your imagination, please press the button below.")
                            .padding(.bottom)
                            .foregroundColor(textColor)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .opacity(isTappedPaint ? 1 : 0)
                    .animation(.easeIn(duration: 1.5), value: isTappedPaint)
                    Color.white
                        .frame(height: screenHeight/3)
                        .border(.black)
                        .padding()
                        .opacity(firstTapped ? 1 : 0)
                        .animation(.easeIn(duration: 1.5), value: firstTapped)
                    
                    Text("That's right! A Canvas without color,\n it would be all white.")
                        .padding(.bottom)
                        .foregroundColor(textColor)
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: screenWidth - 150)
                        .multilineTextAlignment(.center)
                        .opacity(lastTapped ? 1 : 0)
                        .animation(.easeIn(duration: 1.5), value: lastTapped)
                }
                Spacer()
                Button {
                    if (lastTapped) {
                        moveNext = true
                    }
                    if (firstTapped) {
                        lastTapped = true
                    }
                    firstTapped = true
                } label: {
                    if (!lastTapped && isTappedLight || isTappedPaint) {
                        Image(systemName: "chevron.right.square.fill")
                            .imageScale(.large)
                            .foregroundColor(currentColor == .white ? .green : currentColor)
                            .font(.system(size: 40))
                    } else if (lastTapped){
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(currentColor)
                            .overlay(
                                Text("Next")
                                    .foregroundColor(oppositeColor)
                                    .fontWeight(.bold)
                            )
                    } else {
                        
                    }
                }
                .frame(width: 100, height: 50)
                .animation(.easeIn(duration: 0.2), value: didTappedAny)
                Spacer()
                if(isTappedLight){
                    NavigationLink(destination: SecondLightView(currentColor: currentColor, moveToFirst: $moveToFirst), isActive: $moveNext) {
                        Text("")
                    }
                } else {
                    NavigationLink(destination: SecondColorView(currentColor: currentColor, moveToFirst: $moveToFirst), isActive: $moveNext) {
                        Text("")
                    }
                }
            }
        }
    }
}

struct FusionColorView_Previews: PreviewProvider {
    static var previews: some View {
        FusionColorView(textColor: .purple, imageName: "lightbulb.fill", currentColor: .green, oppositeColor: .black, moveToFirst: .constant(false))
    }
}
