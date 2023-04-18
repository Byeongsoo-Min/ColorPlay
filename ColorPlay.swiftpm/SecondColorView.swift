//
//  SecondColorView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/18.
//

import SwiftUI
import UIKit

struct SecondColorView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var currentColor: Color
    let cols = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let colorArray = [Color(UIColor.magenta), Color.purple, Color.green, Color.brown, Color.cyan, Color.gray, Color.orange, Color.pink, Color.yellow]
    
    @State private var nowSelectedColor: [Color] = []
    @State private var isFull = false
    @State private var correctThree = false
    @State private var showAlert = false
    
    @Binding var moveToFirst: Bool
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("All colors can be made in \nthree primary colors.")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Let's find out which color is the three primary colors.")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                ZStack {
                    Color.white
                        .frame(height: screenHeight/2)
                        .padding()
                    VStack {
                        LazyVGrid(columns: cols) {
                            ForEach(0..<colorArray.count) { idx in
                                colorArray[idx]
                                    .frame(height:50)
                                    .border(.black, width: nowSelectedColor.contains(colorArray[idx]) ? 5 : 0)
                                    .padding(.horizontal, 50)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        print("hello\(colorArray[idx])")
                                        if (nowSelectedColor.contains(colorArray[idx])) {
                                            if let firstIdx = nowSelectedColor.firstIndex(of: colorArray[idx]) {
                                                nowSelectedColor.remove(at: firstIdx)
                                            }
                                            print("if condition")
                                        } else {
                                            print("else condition")
                                            nowSelectedColor.append(colorArray[idx])
                                        }
                                        
                                    }
                                    .animation(.default, value: nowSelectedColor.contains(colorArray[idx]))
                                    .alert(isPresented: $isFull) {
                                        let returnButton = Alert.Button.cancel(Text("OK")) {
                                            nowSelectedColor.remove(at: nowSelectedColor.count - 1)
                                        }
                                        return Alert(title: Text("You can choose up to 3 colors!"), dismissButton: returnButton)
                                    }
                                    
                            }
                        }
                        Divider().foregroundColor(.black)
                            .frame(height: 20)
                        ZStack {
                            ForEach(nowSelectedColor.indices, id: \.self) { idx in
                                nowSelectedColor[idx]
                                    .blendMode(BlendMode.multiply)
                                    .padding()
                                    
                            }
                        }
                        .frame(height: screenHeight/4)
                    }
                }
                Text("Hint!\n The more you mix color, the darker the color becomes.\n So... find the most similar combination of Black Color\n when you mix the three Colors!")
                     .font(.system(size: 25, weight: .bold, design: .rounded))
                     .multilineTextAlignment(.center)
                     .foregroundColor(Color.white)
                     .opacity(showAlert ? 1 : 0)
                     .animation(SwiftUI.Animation.easeIn, value: showAlert)
                NavigationLink(destination: ThirdColorView(moveToFirst: $moveToFirst), isActive: $correctThree) {
                    Text("")
                }
            }
            .navigationBarHidden(true)
        }
        .onChange(of: nowSelectedColor) { _ in
            if nowSelectedColor.count == 3 {
                showAlert = true
            }
            if (nowSelectedColor.count >= 4) {
                isFull = true
            } else {
                isFull = false
            }
            if nowSelectedColor.contains(Color(UIColor.magenta)) {
                if nowSelectedColor.contains(Color.yellow) {
                    if nowSelectedColor.contains(Color.cyan) {
                        correctThree = true
                    }
                }
            }
            print(nowSelectedColor)
        }
    }
}

struct SecondColorView_Previews: PreviewProvider {
    static var previews: some View {
        SecondColorView(currentColor: .green, moveToFirst: .constant(false))
    }
}
