import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var container: DependencyContainer
    var body: some View {
        HomeScreenView(viewModel: container.makeHomeViewModel())
    }
}
