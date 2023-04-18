//
//  RectangleView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/19.
//

import SwiftUI

struct RectangleView: View {
    @Binding var rectanglePosition: CGPoint
    var rectangleColor = Color.cyan
        var body: some View {
            VStack {
//                ZStack {
//                    ForEach(rectanglePositions.indices, id: \.self) { idx in
                        Rectangle()
                            .foregroundColor(rectangleColor)
                            .frame(width: 50, height: 50)
                            .position(rectanglePosition)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        rectanglePosition = gesture.location
                                        }
                                )
                                    }
                    
                }
//            }
//        }
}

//struct RectangleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangleView()
//    }
//}
