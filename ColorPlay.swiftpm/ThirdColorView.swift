//
//  ThirdColorView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/18.
//

import SwiftUI
import UIKit

struct ThirdColorView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let colorArray = [Color(UIColor.magenta), Color.cyan, Color.yellow]
    let cols = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    @State private var nowSelectedCircleColor: [Color] = []
    @State private var nowCircleColor: [Color] = [Color.cyan]
    @State var circlePositions = [CGPoint(x: 100, y: 100)]
    
    @State private var nowSelectedRectangleColor: [Color] = []
    @State private var nowRectangleColor: [Color] = [Color.cyan]
    @State var rectanglePositions = [CGPoint(x: 100, y: 100)]
    
    @State private var moveFinal = false
    
    @Binding var moveToFirst: Bool
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            Color.white
                .frame(height: screenHeight / 1.5)
            VStack {
                Text("Make whatever you want!")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                HStack {
                    VStack {
                        Text("Choose the color of the circle!")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        LazyVGrid(columns: cols) {
                            ForEach(0..<colorArray.count) { idx in
                                colorArray[idx]
                                    .frame(width: 50,height:50)
                                    .border(.black, width: nowSelectedCircleColor.contains(colorArray[idx]) ? 5 : 0)
                                    .padding(.horizontal, 50)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        print("hello\(colorArray[idx])")
                                        if (nowSelectedCircleColor.contains(colorArray[idx])) {
                                            if let firstIdx = nowSelectedCircleColor.firstIndex(of: colorArray[idx]) {
                                                nowSelectedCircleColor.remove(at: firstIdx)
                                            }
                                            print("if condition")
                                        } else {
                                            print("else condition")
                                            nowSelectedCircleColor.append(colorArray[idx])
                                        }
                                        
                                    }
                                    .animation(.default, value: nowSelectedCircleColor.contains(colorArray[idx]))
                            }
                        }
                        Text("Click the Circle to add it!")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()
                        ZStack {
                            ForEach(nowSelectedCircleColor.indices, id: \.self) { idx in
                                nowSelectedCircleColor[idx]
                                    .blendMode(BlendMode.multiply)
                                    .clipShape(Circle())
                            }
                        }
                        .frame(height: 50)
                        .foregroundColor(.clear)
                        .onTapGesture {
                            if nowSelectedCircleColor.contains(Color(UIColor.magenta)) {
                                if nowSelectedCircleColor.contains(Color.cyan) {
                                    if nowSelectedCircleColor.contains(Color.yellow) {
                                        nowCircleColor.append(.black)
                                    } else {
                                        nowCircleColor.append(.blue)
                                    }
                                } else if nowSelectedCircleColor.contains(Color.yellow){
                                    nowCircleColor.append(.red)
                                } else {
                                    nowCircleColor.append(Color(UIColor.magenta))
                                }
                            } else if nowSelectedCircleColor.contains(Color.cyan) {
                                if nowSelectedCircleColor.contains(Color.yellow) {
                                    nowCircleColor.append(.green)
                                } else {
                                    nowCircleColor.append(.cyan)
                                }
                            } else {
                                nowCircleColor.append(.yellow)
                            }
                            circlePositions.append(CGPoint(x: 100, y: 100))
                        }
                    }
                    .frame(height: screenHeight / 4)
                    .offset(y:100)
                    VStack {
                        Text("Choose the color of the Rectangle!")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        LazyVGrid(columns: cols) {
                            ForEach(0..<colorArray.count) { idx in
                                colorArray[idx]
                                    .frame(width: 50,height:50)
                                    .border(.black, width: nowSelectedRectangleColor.contains(colorArray[idx]) ? 5 : 0)
                                    .padding(.horizontal, 50)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        print("hello\(colorArray[idx])")
                                        if (nowSelectedRectangleColor.contains(colorArray[idx])) {
                                            if let firstIdx = nowSelectedRectangleColor.firstIndex(of: colorArray[idx]) {
                                                nowSelectedRectangleColor.remove(at: firstIdx)
                                            }
                                            print("if condition")
                                        } else {
                                            print("else condition")
                                            nowSelectedRectangleColor.append(colorArray[idx])
                                        }
                                        
                                    }
                                    .animation(.default, value: nowSelectedRectangleColor.contains(colorArray[idx]))
                            }
                        }
                        Text("Click the Rectangle to add it!")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()
                        ZStack {
                            ForEach(nowSelectedRectangleColor.indices, id: \.self) { idx in
                                nowSelectedRectangleColor[idx]
                                    .blendMode(BlendMode.multiply)
                                    .clipShape(Rectangle())
                            }
                        }
                        .frame(width: 50, height: 50)
                        .foregroundColor(.clear)
                        .onTapGesture {
                            if nowSelectedRectangleColor.contains(Color(UIColor.magenta)) {
                                if nowSelectedRectangleColor.contains(Color.cyan) {
                                    if nowSelectedRectangleColor.contains(Color.yellow) {
                                        nowRectangleColor.append(.black)
                                    } else {
                                        nowRectangleColor.append(.blue)
                                    }
                                } else if nowSelectedRectangleColor.contains(Color.yellow){
                                    nowRectangleColor.append(.red)
                                } else {
                                    nowRectangleColor.append(Color(UIColor.magenta))
                                }
                            } else if nowSelectedRectangleColor.contains(Color.cyan) {
                                if nowSelectedRectangleColor.contains(Color.yellow) {
                                    nowRectangleColor.append(.green)
                                } else {
                                    nowRectangleColor.append(.cyan)
                                }
                            } else {
                                nowRectangleColor.append(.yellow)
                            }
                            rectanglePositions.append(CGPoint(x: 100, y: 100))
                        }
                    }
                    .frame(height: screenHeight / 4)
                    .offset(y:100)
                }
                HStack {
                    ZStack {
                        ForEach(circlePositions.indices, id: \.self) { idx in
                            CircleView(circlePosition: $circlePositions[idx], circleColor: nowCircleColor[idx])
                        }
                    }.blendMode(.multiply)
                    ZStack {
                        ForEach(rectanglePositions.indices, id: \.self) { idx in
                            RectangleView(rectanglePosition: $rectanglePositions[idx], rectangleColor: nowRectangleColor[idx])
                        }
                    }.blendMode(.multiply)
                }.padding()
                Button {
                    moveFinal = true
                } label: {
                    RoundedRectangle(cornerRadius: 11)
                        .foregroundColor(.black)
                        .overlay(
                            Text("End")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        )
                }.frame(width: 100, height: 50)
                NavigationLink(destination: FinalView(isLight: false, moveToFirst: $moveToFirst), isActive: $moveFinal) {
                    Text("")
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ThirdColorView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdColorView(moveToFirst: .constant(false))
    }
}
