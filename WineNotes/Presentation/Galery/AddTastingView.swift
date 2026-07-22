
import SwiftUI

struct AddTastingView: View {
    
    let isFirst: Bool = false
    
    @Binding var tasting: Tasting
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack(spacing: WineLayout.sectionSpacing){
                
                firstAlert
                
                yearAndDateInfo
                
                priceInfo
                
                statusPicker
                
                tastingInfo
                
                descriptionInfo
            }
        }
    }
    
    @ViewBuilder
    private var firstAlert: some View {
        if isFirst{
            HStack{
                Image(systemName: "exclamationmark.circle")
                
                Text("Первая дегустация - добавьте год и заметки")
                
            }
            .font(WineFont.caption(14))
            .foregroundStyle(WineTheme.burgundy)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(WineTheme.burgundy.opacity(0.12))
            .cornerRadius(8)
        }
    }
    
    private var yearAndDateInfo: some View {
        HStack{
            CustomValueTextField(label: "Год урожая", example: "2001", value: $tasting.year)
                .frame(width: UIScreen.main.bounds.width/3)
            
            CustomTextAndDatePicker(label: "Дата", selectedDate: $tasting.date.replacingNil(with: Date()))
        }
    }
    
    private var priceInfo: some View {
        CustomTextField(label: "Цена", example: "1500 ", text: $tasting.price)
    }
    
    private var statusPicker: some View{
        VStack(alignment: .leading){
            Text("Статус")
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
            
            HStack(spacing: 16){
                statusButton(status: .tasted)
                
                statusButton(status: .collection)
            }
        }
    }
    
    @ViewBuilder
    private var tastingInfo: some View {
        if tasting.status == .tasted {
            AddCharacteristicsView(starRating: $tasting.rating, characteristics: $tasting.characters)
        }
    }
    
    private func statusButton(status: WineStatus) -> some View{
        let isActive = tasting.status == status
        return Button {
            withAnimation{
                tasting.status = isActive ? tasting.status : status
            }
        } label: {
            HStack{
                Spacer()
                Text(status.displayName)
                    .font(WineFont.titleLarge(14))
                    .padding(.horizontal, 30)
                    .frame(height: 40)
                    .foregroundColor(isActive ? .white : WineTheme.textPrimary)
                
                Spacer()
            }
            .background(isActive ? WineTheme.burgundy : WineTheme.background)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
        }
    }
    
    private var descriptionInfo: some View {
        CustomTextField(label: "Заметки", example: "Аромат, вкус, послевкусие...", text: $tasting.desc.replacingNil(with: ""), height: 80)
            .padding(.bottom, 80)
    }
}

struct AddCharacteristicsView: View {
    
    @Binding var starRating: Double?
    @Binding var characteristics: WineCharacteristics?
    
    init(starRating: Binding<Double?> = .constant(3.5), characteristics: Binding<WineCharacteristics?> = .constant(WineCharacteristics(acidity: 3, dryness: 3, richness: 3, density: 3))) {
        _starRating = starRating
        _characteristics = characteristics
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: WineLayout.sectionSpacing) {
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    Text("Оценка")
                        .textCase(.uppercase)
                        .font(WineFont.bodySemibold(12))
                        .foregroundColor(WineTheme.gold)
                    
                    HStack(spacing: 8){
                        StarRatingPicker(rating: $starRating.replacingNil(with: 3.5) )
                            .frame(width: 160)
                        Text(String(format: "%.1f", starRating ?? 3.5))
                            .font(WineFont.titleLarge(25))
                            .foregroundStyle(WineTheme.gold)
                    }
                }
                Spacer()
            }
            .padding(12)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.cardRadius)
            .overlay(RoundedRectangle(cornerRadius: WineLayout.cardRadius).stroke(WineTheme.cardBorder, lineWidth: 1))
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Характеристики")
                    .textCase(.uppercase)
                    .font(WineFont.bodySemibold(12))
                    .foregroundColor(WineTheme.gold)
                
                CharacteristicsSliderView(characteristics: $characteristics.replacingNil(with: WineCharacteristics(acidity: 3, dryness: 3, richness: 3, density: 3)))
                
            }
            .padding(12)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.cardRadius)
            .overlay(RoundedRectangle(cornerRadius: WineLayout.cardRadius).stroke(WineTheme.cardBorder, lineWidth: 1))
        }
    }
}


//#Preview {
//    AddTastingView()
//}
