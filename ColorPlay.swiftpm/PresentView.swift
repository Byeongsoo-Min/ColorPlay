//
//  presentView.swift
//  ColorPlay
//
//  Created by MBSoo on 2023/04/05.
//

import SwiftUI

struct PresentModifier<PresentView: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let presentView: PresentView
    
    init(isPresented: Binding<Bool>, @ViewBuilder presentView: @escaping () -> PresentView) {
        self._isPresented = isPresented
        self.presentView = presentView()
    }
    
    func body(content: Content) -> some View {
        content.overlay(isPresented ? presentView : nil)
    }
}

extension View {
    
    func presentNext<PresentView: View>(isPresented: Binding<Bool>,
                                  blurRadius: CGFloat = 3,
                                  blurAnimation: Animation? = .linear,
                                  @ViewBuilder presentView: @escaping () -> PresentView) -> some View {
        return self
            .allowsHitTesting(!isPresented.wrappedValue)
            .modifier(PresentModifier(isPresented: isPresented, presentView: presentView))
    }
}

