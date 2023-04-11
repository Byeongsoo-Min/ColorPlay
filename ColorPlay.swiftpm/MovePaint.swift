//
//  MovePaint.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/11.
//

import SwiftUI

class PaintPosition: ObservableObject {
    @Published var paintColorPosition: [String:CGPoint] = [:]
}

struct MovePaint: View {
    @EnvironmentObject var paintPosition: PaintPosition
    @State private var dragAmount: CGPoint?
    var paintColor: String = "red"
    var colorDict: [String: UIColor] = ["red": UIColor.magenta, "cyan": UIColor.cyan, "yellow": UIColor.yellow]
    var body: some View {
        GeometryReader { gp in // just to center initial position
            ZStack {
                Button(action: self.performAction) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(colorDict[paintColor] ?? .red))
                            .frame(width: 100, height: 100)
                    }
                }
                // Use .none animation for glue effect
                .animation(.default, value: self.dragAmount)
                .position(self.dragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
                .highPriorityGesture(  // << to do no action on drag !!
                    DragGesture()
                        .onChanged { self.dragAmount = $0.location
                            self.paintPosition.paintColorPosition[paintColor] = gp.frame(in: .global).origin
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
        print(paintPosition.paintColorPosition)
    }
}

struct MovePaint_Previews: PreviewProvider {
    static var previews: some View {
        MovePaint()
    }
}
