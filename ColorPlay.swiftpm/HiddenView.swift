//
//  HiddenView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/13.
//

import SwiftUI

struct HiddenView: View {
    let hiddenColor: Color
    var body: some View {
        VStack {
            Text("You have found my Favorite Color!")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(hiddenColor)
                .padding()
            Text("Thank you for playing my App!")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(hiddenColor)
            Text("CREDIT")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(hiddenColor)
                .padding()
            Text("MBSoo FROM SOUTH KOREA")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(hiddenColor)
                .padding()
        }
    }
}

struct HiddenView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenView(hiddenColor: .green)
    }
}
