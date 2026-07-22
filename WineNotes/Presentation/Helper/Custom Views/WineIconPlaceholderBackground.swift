
import SwiftUI

struct WineIconPlaceholderBackground: View {
    var type: WineType
    var body: some View {
        ZStack {
            LinearGradient(
                colors: WineTheme.typeGradient(type),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            Image(systemName: "wineglass.fill")
                .font(.system(size: 28))
                .foregroundStyle(.white.opacity(0.18))
        }
        
    }
}
