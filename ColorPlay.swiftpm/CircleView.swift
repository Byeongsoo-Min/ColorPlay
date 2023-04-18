//
//  PracticeView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/19.
//

import SwiftUI

struct CircleView: View {
    @Binding var circlePosition: CGPoint
    var circleColor = Color.cyan
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(circleColor)
                .frame(width: 50, height: 50)
                .position(circlePosition)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            circlePosition = gesture.location
                        }
                )
        }
    }
}

//struct PracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleView()
//    }
//}
