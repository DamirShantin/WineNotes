import SwiftUI

struct NavIconButton: View {
    let systemImage: String
    let action: () -> ()
    
    init(systemImage: String, action: @escaping () -> Void) {
        self.systemImage = systemImage
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(.black)
                .clipShape(Circle())
        }
        
    }
}

#Preview {
    NavIconButton(systemImage: "plus") {
        //
    }
}
