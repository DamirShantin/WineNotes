import SwiftUI

struct StarRatingPicker: View {
    @Binding var rating: Double
    var size: CGFloat = 28

    private var displayRating: Double {
        (rating * 2).rounded() / 2
        
    }

    private func fillFraction(at index: Int) -> Double {
        let remaining = displayRating - Double(index)
        if remaining >= 1.0 { return 1.0 }
        if remaining >= 0.5 { return 0.5 }
        return 0.0
    }

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 4) {
                ForEach(0..<5, id: \.self) { i in
                    StarFillView(fill: fillFraction(at: i), size: size, color: WineTheme.gold)
                }
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let raw = (value.location.x / geo.size.width) * 5.0
                        let stepped = (min(max(raw, 0.1), 5.0) * 10).rounded() / 10
                        rating = stepped
                    }
            )
        }
        .frame(height: size)
    }
}

#Preview {
    StarRatingPicker(rating: .constant(1.6))
}
