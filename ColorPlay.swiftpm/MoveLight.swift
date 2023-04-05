//
//  MoveLight.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/05.
//

import SwiftUI

struct MoveLight: View {
    @State private var dragAmount: CGPoint?
    var lightColor: Color = .red
    var body: some View {
        GeometryReader { gp in // just to center initial position
            ZStack {
                Button(action: self.performAction) {
                    ZStack {
                        Circle()
                            .foregroundColor(lightColor)
                            .frame(width: 100, height: 100)
                    }
                }
                // Use .none animation for glue effect
                .animation(.default, value: dragAmount)
                .position(self.dragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                .highPriorityGesture(  // << to do no action on drag !!
                    DragGesture()
                        .onChanged { self.dragAmount = $0.location})
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // full space
        }
    }
    func performAction() {
        print("button pressed")
    }
}

struct MoveLight_Previews: PreviewProvider {
    static var previews: some View {
        MoveLight()
    }
}
