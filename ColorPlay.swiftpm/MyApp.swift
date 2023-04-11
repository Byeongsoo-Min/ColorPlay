import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LightPosition())
                .environmentObject(PaintPosition())
        }
    }
}
