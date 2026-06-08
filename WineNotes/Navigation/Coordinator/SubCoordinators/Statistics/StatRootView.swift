
import SwiftUI

struct StatRootView: View {
    @Environment(MainCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("StatRootView")
            
        }
    }
}

extension View {
    func statDestinations(_ route: StatRoute) -> some View {
        Group{
            switch route {
            default: EmptyView()
            }
        }
        
    }
}
