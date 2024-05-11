import SwiftUI
@main
struct Awesome_MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(DependencyContainer())
        }
    }
}
