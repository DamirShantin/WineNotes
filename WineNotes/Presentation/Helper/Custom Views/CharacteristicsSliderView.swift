import SwiftUI

struct CharacteristicsSliderView: View {
    @Binding var characteristics: WineCharacteristics

    var body: some View {
        VStack(spacing: 16) {
            sliderRow(label: "Кислотность",   value: $characteristics.acidity)
            sliderRow(label: "Сухость",       value: $characteristics.dryness)
            sliderRow(label: "Насыщенность",  value: $characteristics.richness)
            sliderRow(label: "Плотность",     value: $characteristics.density)
        }
    }

    private func sliderRow(label: String, value: Binding<Int>) -> some View {
        VStack(spacing: 8) {
            HStack {
                Text(label)
                    .font(WineFont.caption(13))
                    .foregroundColor(WineTheme.textSecondary)
                Spacer()
                Text("\(value.wrappedValue)")
                    .font(WineFont.bodySemibold())
                    .foregroundColor(WineTheme.textPrimary)
                    .frame(width: 20)
            }

            // Custom slider
            GeometryReader { geo in
                let width = geo.size.width
                let fraction = CGFloat(value.wrappedValue - 1) / 4.0
                let filled = width * fraction

                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(WineTheme.sliderBg)
                        .frame(height: 3)

                    Rectangle()
                        .fill(WineTheme.sliderFill)
                        .frame(width: max(0, filled), height: 3)

                    // Thumb
                    Circle()
                        .fill(Color.white)
                        .frame(width: 22, height: 22)
                        .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                        .offset(x: max(0, min(filled - 11, width - 22)))
                }
                .contentShape(Rectangle())
                .gesture(DragGesture(minimumDistance: 0).onChanged { drag in
                    let ratio = drag.location.x / width
                    let raw = ratio * 4 + 1
                    value.wrappedValue = max(1, min(5, Int(raw.rounded())))
                })
            }
            .frame(height: 22)

            // Step labels
//            HStack {
//                ForEach(1...5, id: \.self) { i in
//                    Text("\(i)")
//                        .font(.system(size: 10))
//                        .foregroundColor(WineTheme.textSecondary)
//                    if i < 5 { Spacer() }
//                }
//            }
        }
    }
}

#Preview {
    CharacteristicsSliderView(characteristics: .constant(WineCharacteristics(acidity: 3, dryness: 3, richness: 3, density: 5)))
}
