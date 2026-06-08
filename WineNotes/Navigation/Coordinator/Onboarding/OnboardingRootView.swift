
import SwiftUI

struct OnboardingRootView: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            VStack{
                Text("Onboarding")
                Button("Finish") {c.finishOnboarding()}
            }
                .onboardingNavigationDestinations()
        }
    }
}

extension View {
    func onboardingNavigationDestinations() -> some View {
        navigationDestination(for: OnboardingRoute.self) { route in
            switch route {
            default: EmptyView()
            }
        }

    }
}
