import SwiftUI

struct CharacteristicsDisplayView: View {
    var characteristics: WineCharacteristics

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 14){
                cell(label: "Кислотность",   value: characteristics.acidity)
                cell(label: "Сухость",       value: characteristics.dryness)
            }
            HStack(spacing: 14){
                cell(label: "Насыщенность",  value: characteristics.richness)
                cell(label: "Плотность",     value: characteristics.density)
            }
        }
    }

    private func cell(label: String, value: Int) -> some View {
        VStack{
            HStack(spacing: 12) {
                Text(label)
                    .font(WineFont.caption())
                    .foregroundColor(WineTheme.textSecondary)
                
                Spacer()
                
                Text("\(value)")
                    .font(WineFont.captionMedium())
                    .foregroundColor(WineTheme.textPrimary)
                
                
                
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(WineTheme.sliderBg)
                        .frame(height: 3)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(WineTheme.sliderFill)
                        .frame(width: geo.size.width * CGFloat(value) / 5.0, height: 3)
                }
            }
            .frame(height: 6)
        }
    }
}

#Preview {
    CharacteristicsDisplayView(characteristics: WineCharacteristics(acidity: 1, dryness: 2, richness: 3, density: 4))
}
