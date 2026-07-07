
import SwiftUI

struct TastingCardView: View {
    let tasting: Tasting
    
    var customFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM yyyy"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                VStack(alignment: .leading){
                    // year
                    Text(String(tasting.year))
                        .font(WineFont.titleLarge())
                        .foregroundColor(WineTheme.textPrimary)
                    
                    // date
                    if let date = tasting.date{
                        Text(customFormatter.string(from: date))
                            .font(WineFont.caption(13))
                            .foregroundColor(WineTheme.textSecondary)
                    }
                    
                }
                Spacer()
                VStack(alignment: .trailing){
                    // type
                    Text(tasting.status.displayName)
                        .font(WineFont.captionMedium(12))
                        .foregroundStyle(WineTheme.typeStatusColor(tasting.status))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(WineTheme.typeStatusColor(tasting.status).opacity(0.12))
                        .cornerRadius(8)
                    
                    // rating
                    if let rating = tasting.rating{
                        HStack{
                            StarRatingView(rating: rating, size: 13)
                            Text(String(format: "%.1f", rating))
                                .font(WineFont.caption(14))
                                .foregroundStyle(WineTheme.gold)
                            
                        }
                    } else {
                        // button take rating
                        rateButton {
                            //
                        }
                        
                    }
                }
            }
            // Wine Characteristics
            if let characters = tasting.characters {
                CharacteristicsDisplayView(characteristics: characters)
            }
            
            // description
            Text(tasting.desc ?? "")
                .font(WineFont.caption(13))
                .foregroundColor(WineTheme.textSecondary)
            
            // price
            HStack{
                Text("Цена")
                    .font(WineFont.caption(13))
                    .foregroundColor(WineTheme.textSecondary)
                
                Text(String(tasting.price))
                    .font(WineFont.bodySemibold(12))
                    .foregroundColor(WineTheme.textPrimary)
            }
        }
        .padding(12)
        .background(WineTheme.cardBackground)
        .cornerRadius(WineLayout.cardRadius)
        .overlay(RoundedRectangle(cornerRadius: WineLayout.cardRadius).stroke(WineTheme.cardBorder, lineWidth: 1))
    }
    
    // MARK: Rate button
    private func rateButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .fontWeight(.bold)
                
                Text("Оценить")
                    .font(WineFont.captionMedium(12))
            }
            .padding(.horizontal, 10)
            .frame(height: 22)
            .background(WineTheme.burgundy)
            .foregroundColor(.white)
            .cornerRadius(24)
        }
    }
}

#Preview {
    TastingCardView(tasting: sampleWines[2].tastings[0])
}
#Preview {
    TastingCardView(tasting: sampleWines[2].tastings[1])
}
