import SwiftUI

struct FusionColorView : View {
    var textColor: Color
    let imageName: String
    var body: some View {
        VStack {
            Text("How to make purple?")
                .padding()
                .foregroundColor(textColor)
            Image(systemName: imageName)
                .padding()
            HStack {
                MoveLight(lightColor: .red)
                MoveLight(lightColor: .blue)
                MoveLight(lightColor: .green)
            }
        }
    }
}

struct ContentView: View {
    @State var currentColor: Color = .white
    @State var oppositeColor: Color = .black
    @State var showFirst = false
    var body: some View {
        NavigationView {
            ZStack {
                //            currentColor
                //                .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Say Wonderful")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .padding(.leading)
                        Image(systemName: "paintpalette.fill")
                            .imageScale(.large)
                        Spacer()
                    }
                    .foregroundColor(oppositeColor)
                    ColorPicker("Choose your favorite!", selection: $currentColor, supportsOpacity: true)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .foregroundColor(.blue)
                        .font(.headline)
                    FusionColorView(textColor: oppositeColor, imageName: "lightbulb.fill")
                    FusionColorView(textColor: oppositeColor, imageName: "paintbrush.fill")
                    Spacer()
                    Button {
                        showFirst = true
                    } label: {
                        RoundedRectangle(cornerRadius: 11)
                            .foregroundColor(currentColor)
                            .overlay(
                                Text("Start")
                                    .foregroundColor(oppositeColor)
                                    .fontWeight(.bold)
                            )
                    }.frame(width: 100, height: 50)
                    Spacer()
                    NavigationLink(destination: FirstView(), isActive: $showFirst) {
                        Text("")
                    }
                }
                
            }
            .onChange(of: currentColor) { _ in
                var rgbSum = 0.0
                if let colorArray = currentColor.cgColor?.components {
                    for i in colorArray {
                        rgbSum += i
                    }
                } else {
                    
                }
                if rgbSum < 2.0 {
                    oppositeColor = Color.white
                } else {
                    oppositeColor = Color.black
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
