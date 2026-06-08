
import SwiftUI

struct LibRootView: View {
    @Environment(MainCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("LibRootView")
            
        }
    }
}

extension View {
    func libDestinations(_ route: LibRoute) -> some View {
        Group{
            switch route {
            default: EmptyView()
            }
        }
        
    }
}
