import SwiftUI


struct StarRatingView: View {
    var rating: Double
    var size: CGFloat = 16

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
        HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { i in
                StarFillView(fill: fillFraction(at: i), size: size, color: WineTheme.gold)
            }
        }
    }
}

struct StarFillView: View {
    let fill: Double    
    let size: CGFloat
    let color: Color

    var body: some View {
        ZStack(alignment: .leading) {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .foregroundStyle(Color.gray.opacity(0.22))

            if fill > 0 {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundStyle(color)
                    .mask(alignment: .leading) {
                        Rectangle()
                            .frame(width: size * fill, height: size)
                    }
            }
        }
        .frame(width: size, height: size)
    }
}
