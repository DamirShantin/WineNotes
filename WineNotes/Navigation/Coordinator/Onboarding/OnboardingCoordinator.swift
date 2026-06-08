
import SwiftUI

@Observable
final class OnboardingCoordinator {
    var path = NavigationPath()
    
    private weak var app: AppCoordinator?
    init(app: AppCoordinator) {
        self.app = app
    }
    
    func showPage2()        {  }
    func showPage3()        {  }
    func finishOnboarding() { app?.finishOnboarding()}
    
    func push(_ route: OnboardingRoute) { path.append(route) }
    func pop()       { if !path.isEmpty { path.removeLast() } }

}
