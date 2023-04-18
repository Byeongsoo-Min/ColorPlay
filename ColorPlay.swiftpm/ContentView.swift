import SwiftUI


struct ContentView: View {
    @State var currentColor: Color = .white
    @State var oppositeColor: Color = .black
    @State var showFirst = false
    @State var show1 = false
    @State var show2 = false
    @State var show3 = false
    @State var show4 = false
    @State var showHidden = false
    @State var horray = false
    @State var moveToFirstView = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.3)
                                .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Text("Say Wonderful")
                            .font(.system(size: 50, design: .rounded))
                            .bold()
                            .padding(.leading)
                        Image(systemName: "paintpalette.fill")
                            .imageScale(.large)
                            .font(.system(size: 30))
                            .foregroundColor(currentColor == .white ? .green : currentColor)
                            .onTapGesture {
                                showHidden = true
                            }
                            .alert(isPresented: $showHidden) {
                                Alert(title: Text("You've found hidden button! If you know my favorite color... choose it in the picker!"), primaryButton: Alert.Button.cancel(Text("OK!")), secondaryButton: Alert.Button.default(Text("I will do it!")))
                            }
                        Spacer()
                    }
                    .foregroundColor(currentColor == .white ? .black : currentColor)
                    Spacer()
                        .frame(height: 200)
                    Text("We can see many colors in our daily lives.")
                        .font(.system(size: 30, weight: .bold))
                        .opacity(show1 ? 1 : 0)
                        .animation(.easeIn(duration: 0.2), value: show1)
                    Spacer()
                        .frame(height: 200)
                    Text("Among many colors, what is your favorite color?")
                        .font(.system(size: 30, weight: .bold))
                        .opacity(show2 ? 1 : 0)
                        .animation(.easeIn(duration: 0.2), value: show2)
                    ColorPicker("Choose your favorite!", selection: $currentColor, supportsOpacity: true)
                        .padding()
                        .background(currentColor)
                        .cornerRadius(10)
                        .foregroundColor(oppositeColor)
                        .font(.headline)
                        .opacity(show3 ? 1 : 0)
                        .animation(.easeIn(duration: 0.2), value: show3)
                    Spacer()
                    Button {
                        if(show4) {
                            showFirst = true
                        }
                        if(show3) {
                            show4 = true
                        }
                        if(show2) {
                            show3 = true
                        }
                        if(show1) {
                            show2 = true
                        }
                        show1 = true
                    } label: {
                        if (!show4) {
                            Image(systemName: "chevron.right.square.fill")
                                .imageScale(.large)
                                .foregroundColor(currentColor == .white ? .green : currentColor)
                                .font(.system(size: 40))
                        } else {
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundColor(currentColor)
                                .overlay(
                                    Text("Start")
                                        .foregroundColor(oppositeColor)
                                        .fontWeight(.bold)
                                )
                        }
                    }
                    .frame(width: 100, height: 50)
                    .animation(.easeIn(duration: 0.2), value: show4)
                    NavigationLink(destination: FirstView(currentColor: $currentColor, oppositeColor: $oppositeColor, moveToFirst: $moveToFirstView), isActive: $showFirst) {
                        Text("")
                    }.navigationBarHidden(true)
                    NavigationLink(destination: HiddenView(hiddenColor: currentColor), isActive: $horray) {
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
                    if colorArray[0] > 0.39 && colorArray[0] < 0.64 {
                        if colorArray[1] > 0.61 && colorArray[1] < 0.83 {
                            if colorArray[2] > 0.26 && colorArray[2] < 0.44 {
                                horray = true
                            }
                        }
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
