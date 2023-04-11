import SwiftUI

struct FusionColorView : View {
    var textColor: Color
    let imageName: String
    let imageDict = ["lightbulb.fill" : "lightbulb", "paintbrush.fill" : "paintbrush"]
    var currentColor: Color
    var oppositeColor: Color
    
    @State var redPoint: CGPoint?
    @State var bluePoint: CGPoint?
    @State var greenPoint: CGPoint?
    @State private var isTapped = false
    @State var dragAmount: CGPoint?
    
    var lightColor: Color = .red
    var body: some View {
        VStack {
            Text("How to make purple?")
                .padding()
                .foregroundColor(textColor)
                .font(.system(size: 25, weight: .bold))
            if(imageName == "lightbulb.fill") {
                Text("If you want to make Color with the light, Press this!")
                    .padding(.bottom)
                    .foregroundColor(textColor)
                    .font(.system(size: 25, weight: .bold))
            } else {
                Text("If you want to make Color with the paint, Press this!")
                    .padding(.bottom)
                    .foregroundColor(textColor)
                    .font(.system(size: 25, weight: .bold))
            }
            Image(systemName: isTapped ? imageName : imageDict[imageName]!)
                .imageScale(.large)
                .padding(.bottom)
                .foregroundColor(isTapped ? self.currentColor : self.oppositeColor)
                .onTapGesture {
                    isTapped.toggle()
                }
                .animation(.default, value: isTapped)
            HStack {
                if(imageName == "lightbulb.fill") {
                    MoveLight(lightColor: "red")
                    MoveLight(lightColor: "blue")
                    MoveLight(lightColor: "green")
                } else {
                    MovePaint(paintColor: "Magenta")
                    MovePaint(paintColor: "cyan")
                    MovePaint(paintColor: "yellow")
                }
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
                Color.gray.opacity(0.3)
                                .ignoresSafeArea()
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
                    FusionColorView(textColor: oppositeColor, imageName: "lightbulb.fill", currentColor: self.currentColor, oppositeColor: self.oppositeColor)
                    FusionColorView(textColor: oppositeColor, imageName: "paintbrush.fill", currentColor: self.currentColor, oppositeColor: self.oppositeColor)
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
