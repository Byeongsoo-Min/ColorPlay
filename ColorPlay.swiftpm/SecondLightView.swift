//
//  SecondLightView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/18.
//

import SwiftUI

struct SecondLightView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var currentColor: Color
    let cols = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let lightArray = [Color.red, Color.purple, Color.green, Color.brown, Color.blue, Color.mint, Color.indigo, Color.pink, Color.yellow]
    
    @State private var nowSelectedLight: [Color] = []
    @State private var isFull = false
    @State private var correctThree = false
    
    @State private var showAlert = false
    
    @Binding var moveToFirst: Bool
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("All lights can be made in\n three primary colors")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Let's find out which light is the three primary colors.")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                ZStack {
                    Color.black
                        .frame(height: screenHeight/2)
                        .padding()
                    VStack {
                        LazyVGrid(columns: cols) {
                            ForEach(0..<lightArray.count) { idx in
                                lightArray[idx]
                                    .frame(height:50)
                                    .border(.white, width: nowSelectedLight.contains(lightArray[idx]) ? 5 : 0)
                                    .padding(.horizontal, 50)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        print("hello\(lightArray[idx])")
                                        if (nowSelectedLight.contains(lightArray[idx])) {
                                            if let firstIdx = nowSelectedLight.firstIndex(of: lightArray[idx]) {
                                                nowSelectedLight.remove(at: firstIdx)
                                            }
                                            print("if condition")
                                        } else {
                                            print("else condition")
                                            nowSelectedLight.append(lightArray[idx])
                                        }
                                        
                                    }
                                    .animation(.default, value: nowSelectedLight.contains(lightArray[idx]))
                                    .alert(isPresented: $isFull) {
                                        let returnButton = Alert.Button.cancel(Text("OK")) {
                                            nowSelectedLight.remove(at: nowSelectedLight.count - 1)
                                        }
                                        return Alert(title: Text("You can choose up to 3 lights!"), dismissButton: returnButton)
                                    }
                                    
                            }
                        }
                        Divider().background(Color.white)
                            .frame(minHeight: 20)
                        ZStack {
                            ForEach(nowSelectedLight.indices, id: \.self) { idx in
                                nowSelectedLight[idx]
                                    .blendMode(BlendMode.screen)
                                    .padding()
                                    
                            }
                        }
                        .blendMode(SwiftUI.BlendMode.plusLighter)
                        .frame(height: screenHeight/4)
                    }
                }
                   Text("Hint!\n The more light you mix, the brighter it gets.\n So... find the most similar combination of white light\n when you mix the three lights!")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                        .opacity(showAlert ? 1 : 0)
                        .animation(SwiftUI.Animation.easeIn, value: showAlert)
                NavigationLink(destination: ThirdLightView( moveToFirst: $moveToFirst), isActive: $correctThree) {
                    Text("")
                }
            }
            .navigationBarHidden(true)
        }
        .onChange(of: nowSelectedLight) { _ in
            if nowSelectedLight.count == 3 {
                showAlert = true
            }
            if (nowSelectedLight.count >= 4) {
                isFull = true
            } else {
                isFull = false
            }
            if nowSelectedLight.contains(Color.red) {
                if nowSelectedLight.contains(Color.blue) {
                    if nowSelectedLight.contains(Color.green) {
                        correctThree = true
                    }
                }
            }
            print(nowSelectedLight)
        }
    }
}

struct SecondLightView_Previews: PreviewProvider {
    static var previews: some View {
        SecondLightView(currentColor: .green, moveToFirst: .constant(false))
    }
}
