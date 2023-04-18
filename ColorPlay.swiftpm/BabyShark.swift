//
//  BabyShark.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/19.
//

import SwiftUI

struct BabyShark: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // Head
            let headWidth = rect.width * 0.5
            let headHeight = rect.height * 0.5
            let headRect = CGRect(x: rect.midX - headWidth / 2, y: rect.minY, width: headWidth, height: headHeight)
            let headCornerRadii = CGSize(width: headWidth / 2, height: headHeight / 2)
            path.addRoundedRect(in: headRect, cornerSize: headCornerRadii)
            
            // Body
            let bodyWidth = headWidth * 0.7
            let bodyHeight = rect.height * 0.35
            let bodyRect = CGRect(x: rect.midX - bodyWidth / 2, y: rect.midY, width: bodyWidth, height: bodyHeight)
            path.addRoundedRect(in: bodyRect, cornerSize: headCornerRadii)
            
            // Tail
            let tailWidth = headWidth * 0.3
            let tailHeight = rect.height * 0.15
            let tailRect = CGRect(x: rect.midX - tailWidth / 2, y: rect.maxY - tailHeight, width: tailWidth, height: tailHeight)
            let tailCornerRadii = CGSize(width: tailWidth / 2, height: tailHeight / 2)
            path.addRoundedRect(in: tailRect, cornerSize: tailCornerRadii)
            
            // Fin
            let finSize = CGSize(width: headWidth * 0.2, height: headHeight * 0.2)
            let finRect = CGRect(x: headRect.minX - finSize.width / 2, y: headRect.midY - finSize.height / 2, width: finSize.width, height: finSize.height)
            path.addRoundedRect(in: finRect, cornerSize: headCornerRadii)
            
            // Left side
            path.move(to: CGPoint(x: headRect.minX, y: headRect.maxY))
            path.addQuadCurve(to: CGPoint(x: bodyRect.minX, y: bodyRect.maxY), control: CGPoint(x: headRect.minX * 0.9, y: rect.maxY))
            path.addLine(to: CGPoint(x: tailRect.maxX, y: tailRect.midY))
            path.addLine(to: CGPoint(x: bodyRect.minX, y: bodyRect.minY))
            path.addLine(to: CGPoint(x: headRect.minX, y: headRect.minY))
            path.addLine(to: CGPoint(x: headRect.minX, y: headRect.maxY))
            
            return path
        }
}

//struct BabyShark_Previews: PreviewProvider {
//    static var previews: some View {
//        BabyShark()
//    }
//}
