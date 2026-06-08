
import SwiftUI

struct ProfileRootView: View {
    @Environment(MainCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("ProfileRootView")
            
        }
    }
}

extension View {
    func profileDestinations(_ route: ProfileRoute) -> some View {
        Group{
            switch route {
            default: EmptyView()
            }
        }
        
    }
}
