//
//  FirstView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/05.
//

import SwiftUI

struct FirstView: View {
    @State private var firstTap = false
    @State private var secondTap = false
    @State private var thirdTap = false
    
    @Binding var currentColor: Color
    @Binding var oppositeColor: Color
    @Binding var moveToFirst:Bool
    var body: some View {
        VStack {
            FusionColorView(textColor: oppositeColor, imageName: "lightbulb.fill", currentColor: currentColor, oppositeColor: oppositeColor, moveToFirst: $moveToFirst)
            
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(currentColor: .constant(.green), oppositeColor: .constant(.purple), moveToFirst: .constant(false))
    }
}
