
import SwiftUI

struct GaleryRootView: View {
    @Environment(MainCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("GaleryRootView")
            
        }
    }
}

extension View {
    func galeryDestinations(_ route: GaleryRoute) -> some View {
        Group{
            switch route {
            default: EmptyView()
            }
        }
        
    }
}
