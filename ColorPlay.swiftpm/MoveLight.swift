//
//  MoveLight.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/05.
//

import SwiftUI

class LightPosition: ObservableObject {
    @Published var colorPosition: [String:CGPoint] = [:]
}

struct MoveLight: View {
    @EnvironmentObject var lightPosition: LightPosition
    @State private var dragAmount: CGPoint?
    var lightColor: String = "red"
    var colorDict: [String: Color] = ["red": Color.red, "blue": Color.blue, "green": Color.green]
    var body: some View {
        GeometryReader { gp in // just to center initial position
            ZStack {
                Button(action: self.performAction) {
                    ZStack {
                        Circle()
                            .foregroundColor(colorDict[lightColor])
                            .frame(width: 40, height: 40)
                    }
                }
                // Use .none animation for glue effect
                .animation(.default, value: self.dragAmount)
                .position(self.dragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                .highPriorityGesture(  // << to do no action on drag !!
                    DragGesture()
                        .onChanged { self.dragAmount = $0.location
                            self.lightPosition.colorPosition[lightColor] = gp.frame(in: .global).origin
                        })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // full space
            .onAppear(
//                perform: self.lightPosition.colorPosition[lightColor] = gp.frame(in: .global).origin
            )
        }
    }
    func performAction() {
        print("button pressed")
        print(lightPosition.colorPosition)
    }
}

struct MoveLight_Previews: PreviewProvider {
    static var previews: some View {
        MoveLight()
    }
}
