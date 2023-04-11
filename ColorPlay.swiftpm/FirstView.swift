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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
