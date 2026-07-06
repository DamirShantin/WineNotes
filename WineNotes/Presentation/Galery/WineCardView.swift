import SwiftUI

struct WineCardView: View {
    var wine: Wine

    var body: some View {
        ZStack{
//            Color.red
            HStack {
                // icon
                iconWine(wine.type)
                    .frame(width: 54, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // all info
                VStack(alignment: .leading, spacing: 5){
                    
                    VStack(alignment: .leading, spacing: 0){
                        HStack{
                            Text(wine.name)
                                .font(WineFont.bodySemibold(16))
                                .foregroundColor(WineTheme.textPrimary)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text("\(wine.tastedCount) дег.")
                                .font(WineFont.captionMedium(10))
                                .foregroundStyle(WineTheme.burgundy)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(WineTheme.burgundy.opacity(0.12))
                                .cornerRadius(8)

                        }
                        
                        HStack(spacing: 0){
                            Text(wine.tastedYearsText)
                                .font(WineFont.caption(13))
                                .foregroundColor(WineTheme.textSecondary)
                            
                            
                            Text("· \(wine.region)")
                                .font(WineFont.caption(13))
                                .foregroundColor(WineTheme.textSecondary)
                        }
                    }
                    
                    // wine type
                    wineType(wine.type)
                    
                    HStack{
                        // rating
                        if let r = wine.averageRating {
                            HStack{
                                StarRatingView(rating: r, size: 13)
                                Text(String(format: "%.1f", r))
                                    .font(WineFont.caption(13))
                                    .foregroundStyle(WineTheme.gold)
                                
                            }
                        } else {
                            Text("Нет оценки")
                                .font(WineFont.caption(13))
                                .foregroundColor(WineTheme.textSecondary)
                        }
                        
                        Spacer()
                        
                        // status badge
                        Text(wine.status.displayName.uppercased())
                            .font(WineFont.captionMedium(10))
                            .foregroundStyle(WineTheme.typeStatusColor(wine.status))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(WineTheme.typeStatusColor(wine.status).opacity(0.12))
                            .cornerRadius(8)

                    }
                }
            }
            .padding(12)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.cardRadius)
            .overlay(RoundedRectangle(cornerRadius: WineLayout.cardRadius).stroke(WineTheme.cardBorder, lineWidth: 1))
            
            
        }

    }

    // MARK: Icon wine
    private func iconWine(_ type: WineType) -> some View {
        ZStack{
            // placeholder background
            WineIconPlaceholderBackground(type: type)
            
            
        }
        
    }
    
    //MARK: Wine type
    private func wineType(_ type: WineType) -> some View {
        HStack(spacing: 5) {
            Circle()
                .fill(WineTheme.typeDotColor(type))
                .frame(width: 8, height: 8)
            Text(type.displayName.uppercased())
                .font(WineFont.captionMedium(10))
                .foregroundStyle(WineTheme.typeDotColor(type))
        }
    }
}

#Preview {
    WineCardView(wine: sampleWines[2])
}
