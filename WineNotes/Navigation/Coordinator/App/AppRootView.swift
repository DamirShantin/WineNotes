
import SwiftUI

struct AppRootView: View {
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        ZStack{
            switch coordinator.selectedWindow{
            case .main: MainRootView().environment(MainCoordinator(app: coordinator))
            case .onboarding: OnboardingRootView().environment(OnboardingCoordinator(app: coordinator))
            }
        }
    }
}
