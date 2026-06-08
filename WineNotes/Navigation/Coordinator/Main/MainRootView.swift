
import SwiftUI

struct MainRootView: View {
    @Environment(MainCoordinator.self) private var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            CustomTabView(selectedTab: $c.selectedTab)
                .mainNavigationDestinations()
        }
    }
}

extension View {
    func mainNavigationDestinations() -> some View {
        navigationDestination(for: MainRoute.self) { route in
            switch route {
            case .galery(let val):  galeryDestinations(val)
            case .lib(let val):     libDestinations(val)
            case .profile(let val): profileDestinations(val)
            case .stat(let val):    statDestinations(val)
            }
        }

    }
}
