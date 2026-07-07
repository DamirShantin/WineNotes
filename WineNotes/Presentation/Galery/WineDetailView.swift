
import SwiftUI

struct WineDetailView: View {
    @State private var wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    var body: some View {
        ZStack{
            WineTheme.background
            VStack{
                // Hero header
                heroHeader(wine.type)
                
                // all info
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            HStack{
                                Text(wine.name)
                                    .font(WineFont.bodySemibold(22))
                                    .foregroundColor(WineTheme.textPrimary)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                // edit wine button
                                editButton{
                                    // edit wine
                                }
                                
                            }
                            
                            Text("\(wine.country), \(wine.region)")
                                .font(WineFont.caption(13))
                                .foregroundColor(WineTheme.textSecondary)
                            
                            // type
                            wineType(wine.type)
                            
                            // rating
                            HStack(spacing: 0){
                                if let r = wine.averageRating {
                                    HStack{
                                        StarRatingView(rating: r, size: 18)
                                        Text(String(format: "%.1f", r))
                                            .font(WineFont.caption(16))
                                            .foregroundStyle(WineTheme.gold)
                                        
                                    }
                                } else {
                                    Text("Нет оценки")
                                        .font(WineFont.caption(13))
                                        .foregroundColor(WineTheme.textSecondary)
                                }
                                
                                Text(" · ср. по \(wine.tastings.count)")
                                    .font(WineFont.caption(11))
                                    .foregroundColor(WineTheme.textSecondary)
                            }
                            .padding(.vertical, 8)
                            
                            Text("СОРТА")
                                .font(WineFont.captionMedium(12))
                                .foregroundStyle(WineTheme.gold)
                            
                            
                            // grapes
                            grapes(wine.grapes)
                            
                        }
                        .padding(12)
                        .background(WineTheme.cardBackground)
                        .cornerRadius(WineLayout.cardRadius)
                        .overlay(RoundedRectangle(cornerRadius: WineLayout.cardRadius).stroke(WineTheme.cardBorder, lineWidth: 1))
                        
                        HStack{
                            HStack{
                                Text("Дегустации ")
                                    .font(WineFont.bodySemibold(16))
                                    .foregroundColor(WineTheme.textPrimary)
                                
                                Text("\(wine.tastings.count)")
                                    .font(WineFont.caption(13))
                                    .foregroundColor(WineTheme.textSecondary)
                            }
                            
                            Spacer()
                            
                            //button add
                            addButton{
                                // add tastings
                            }
                            
                        }
                        .padding(.vertical, 8)
                        
                        LazyVStack{
                            ForEach(wine.tastings){ tasting in
                                TastingCardView(tasting: tasting)
                            }
                        }
                    }
                }
                .padding(.horizontal, WineLayout.paddingHorizontal)
                
                
                
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: Hero header
    private func heroHeader(_ type: WineType) -> some View {
        WineIconPlaceholderBackground(type: type)
            .frame(height: 200)
            .overlay {
                LinearGradient(colors: [WineTheme.background, .white.opacity(0), .white.opacity(0), .white.opacity(0)], startPoint: .bottom, endPoint: .top)
            }
            .overlay {
                VStack{
                    HStack{
                        NavIconButton(systemImage: "chevron.left"){
                            // back
                        }
                        Spacer()
                        NavIconButton(systemImage: "square.and.arrow.up"){
                            // shared
                        }
                    }
                    .padding(.horizontal, WineLayout.paddingHorizontal)
                    .padding(.top, 48)
                    Spacer()
                }
                
            }
    }
    
    
    // MARK: change button
    private func editButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack{
                
                
                Text("Изменить")
                    .font(WineFont.captionMedium(14))
            }
            .padding(.horizontal, 14)
            .frame(height: 28)
            .background(WineTheme.cardBorder)
            .foregroundColor(WineTheme.textPrimary)
            .cornerRadius(10)
            
            
        }
    }
    
    
    //MARK: Wine type
    private func wineType(_ type: WineType) -> some View {
        HStack(spacing: 5) {
            Circle()
                .fill(WineTheme.typeDotColor(type))
                .frame(width: 9, height: 9)
            Text(type.displayName.uppercased())
                .font(WineFont.captionMedium(12))
                .foregroundStyle(WineTheme.typeDotColor(type))
        }
    }
    
    // MARK: Grapes
    private func grapes(_ grapes: [Grape]) -> some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8){
                ForEach(grapes){ grape in
                    grapeChip(label: grape.name) {
                        // go to grape detail
                    }
                }
            }
        }
    }
    
    private func grapeChip(label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(WineFont.captionMedium())
                .padding(.horizontal, 14)
                .frame(height: 22)
                .background(WineTheme.burgundy)
                .foregroundColor(.white)
                .cornerRadius(20)
                .lineLimit(1)
        }
    }
    
    // MARK: Add button
    private func addButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack{
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .fontWeight(.bold)
                
                Text("Добавить")
                    .font(WineFont.captionMedium(14))
            }
            .padding(.horizontal, 14)
            .frame(height: 28)
            .background(WineTheme.burgundy)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
    
    
}

#Preview {
    WineDetailView(wine: sampleWines[2])
}
