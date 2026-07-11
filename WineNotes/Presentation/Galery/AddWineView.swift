
import SwiftUI

struct AddWineView: View {
    @State private var currentPage: Int = 1
    
    @State private var nameWine:        String = ""
    @State private var textCountry:     String = ""
    @State private var textRegion:      String = ""
    @State private var selectedType:    WineType = .still
    @State private var selectedColor:   WineColor = .red
    @State private var grapes:          [Grape] = []
    @State private var searchGrapeText: String = ""
    
    @State private var tasting: Tasting?
    
    var body: some View {
        VStack(spacing: 0){
            // header
            header()
                .padding(.horizontal, WineLayout.paddingHorizontal)
            // divider
            divider
                .padding(.top, 8)
            
            if currentPage == 1 {
                AddWinePageOne(nameWine: $nameWine,
                               country: $textCountry,
                               region: $textRegion,
                               selectedType: $selectedType,
                               selectedColor: $selectedColor,
                               grapes: $grapes,
                               searchGrapeText: $searchGrapeText)
                
                .padding(.horizontal, WineLayout.paddingHorizontal)
                .padding(.top)
                .background(WineTheme.background)

                
            } else {
                AddWinePageTwo()
                    .padding(.horizontal, WineLayout.paddingHorizontal)
            }
                
            
        }
    }
    
    // MARK: Header
    private func header() -> some View {
        HStack {
            Button{
                withAnimation{
                    currentPage = 1
                }
            } label: {
                Text("Отмена")
                    .font(WineFont.bodySemibold(16))
                    .foregroundColor(WineTheme.burgundy)
                    .frame(width: 90, alignment: .leading)

            }
            Spacer()
            VStack{
                Text("Добавть вино")
                    .font(WineFont.bodySemibold(16))
                    .foregroundColor(WineTheme.textPrimary)
                
                Text("Шаг \(currentPage) из 2")
                    .font(WineFont.caption(13))
                    .foregroundColor(WineTheme.textSecondary)
            }
            Spacer()
            Button{
                withAnimation{
                    currentPage = 2
                }
            }label: {
                Text(currentPage == 1 ? "Далее" : "Сохранить")
                    .font(WineFont.bodySemibold(16))
                    .foregroundColor(WineTheme.burgundy)
                    .frame(width: 90, alignment: .trailing)
            }
            
        }
    }
    
    // MARK: Divider
    private var divider: some View {
        GeometryReader{ geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(WineTheme.sliderBg)
                    .frame(height: 2)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(WineTheme.sliderFill)
                    .frame(width: geo.size.width * CGFloat(currentPage) / 2.0, height: 2)
            }
        }
        .frame(height: 2)
    }
}

// MARK: - Page one
struct AddWinePageOne: View {
    @Binding var nameWine: String
    @Binding var country: String
    @Binding var region: String
    @Binding var selectedType: WineType
    @Binding var selectedColor: WineColor
    @Binding var grapes: [Grape]
    @Binding var searchGrapeText: String
    
    let testColor = Color(hex: "#a99298")
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: WineLayout.cardSpacing){
                // icon
                iconWine
                
                // name
                CustomTextField(label: "Название",example: "Chateu Margaux", text: $nameWine)
                
                // country and region
                HStack(spacing: WineLayout.sectionSpacing){
                    CustomTextField(label: "Страна", example: "Франция", text: $country)
                    
                    CustomTextField(label: "Регион", example: "Бордо", text: $region)
                }
                
                // type
                typeWine
                
                // color
                colorWine()
                                
                // added grapes
                allAddedGrapes(grape: $grapes)
                
                // search grapes
                searchGrape
                
                // favorite grapes
                favoriteGrape
                
            }
        }
    }
    
    // MARK: Icon or photo wine button
    private var iconWine: some View {
        return Button {
            // take icon or photo
        } label: {
            HStack{
                Spacer()
                VStack(alignment: .center, spacing: 8) {
                    Image(systemName: "camera")
                        .font(WineFont.caption(30))
                        .foregroundColor(WineTheme.textSecondary)
                    
                    Text("Этикетка")
                        .font(WineFont.caption(13))
                        .foregroundColor(WineTheme.textSecondary)
                }
                Spacer()
            }
            .frame(height: 120)
            .background(WineTheme.cardBackground)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(WineTheme.inputBorder, style: StrokeStyle(lineWidth: 2, dash: [6,4]))
            )
        }
    }
    
    // MARK: Type wine
    private var typeWine: some View{
        VStack(alignment: .leading){
            Text("Тип вина")
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
            
            HStack(spacing: 8) {
                ForEach(WineType.allCases, id: \.self) { type in
                    typeChip(type: type)
                }
            }
        }
    }
    
    private func typeChip(type: WineType) -> some View {
        let isActive = selectedType == type
        return Button {
            selectedType = isActive ? .still : type
        } label: {
            Text(type.displayName)
            .font(WineFont.captionMedium(12))
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(isActive ? WineTheme.burgundy : WineTheme.background)
            .foregroundColor(isActive ? .white : WineTheme.textPrimary)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
        }
    }
    
    // MARK: Color wine
    private func colorWine() -> some View{
        VStack(alignment: .leading){
            Text("Цвет вина")
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
            
            HStack{
                ForEach(WineColor.allCases, id: \.self){ color in
                    colorChip(color: color)
                }
            }
        }
    }
    
    private func colorChip(color: WineColor) -> some View {
        let isActive = selectedColor == color
        return Button {
            selectedColor = isActive ? .red : color
        } label: {
            Text(color.displayName)
            .font(WineFont.captionMedium(12))
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(isActive ? WineTheme.burgundy : WineTheme.background)
            .foregroundColor(isActive ? .white : WineTheme.textPrimary)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
        }
    }
    
    // MARK: Grape
    private var searchGrape: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16))
                .foregroundColor(WineTheme.placeholder)
            TextField("Поиск сорта...", text: $searchGrapeText)
                .font(WineFont.body())
                .foregroundColor(WineTheme.textPrimary)
            if !searchGrapeText.isEmpty {
                Button { searchGrapeText = "" } label: {
                    Image(systemName: "xmark.circle.fill").foregroundColor(WineTheme.placeholder)
                }
            }
        }
        .padding(.horizontal, 14)
        .frame(height: 34)
        .background(WineTheme.cardBackground)
        .cornerRadius(WineLayout.inputRadius)
        .overlay(
            RoundedRectangle(cornerRadius: WineLayout.inputRadius)
                .stroke(WineTheme.inputBorder, lineWidth: 1)
        )
    }
    
    private var favoriteGrape: some View {
        FlowLayout{
            ForEach(sampleGrapes){ grape in
                chipFavoriteGrape(grape: grape)
            }
        }
    }
    
    @ViewBuilder
    private func chipFavoriteGrape(grape: Grape) -> some View {
        let isActive = grapes.contains(where: { $0 == grape})
        Button {
            withAnimation{
                checkGrape(grape)
            }
        } label: {
            HStack(spacing: 5) {
                Circle()
                    .fill(WineTheme.typeDotColor(grape.color))
                    .frame(width: 8, height: 8)
                Text(grape.name)
                    .font(WineFont.captionMedium())
            }
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(isActive ? WineTheme.burgundy : WineTheme.filterBg)
            .foregroundColor(isActive ? .white : WineTheme.textPrimary)
            .cornerRadius(20)
        }
    }
    
    @ViewBuilder
    private func allAddedGrapes(grape: Binding<[Grape]>) -> some View {
        FlowLayout{
            ForEach(grapes){ grape in
                chipAddedGrape(grape: grape)
            }
        }
    }
    
    @ViewBuilder
    private func chipAddedGrape(grape: Grape) -> some View {
        HStack(spacing: 5){
            Text(grape.name)
                .font(WineFont.captionMedium())
                
            Button {
                withAnimation{
                    checkGrape(grape)
                }
            } label: {
                Text("x")
                    .font(WineFont.captionMedium())
            }
        }
        .padding(.horizontal, 14)
        .frame(height: 24)
        .background(WineTheme.burgundy)
        .foregroundColor(.white)
        .cornerRadius(20)
        
    }
    
    private func checkGrape(_ grape: Grape) {
        if let index = grapes.firstIndex(of: grape) {
            grapes.remove(at: index)
        } else {
            grapes.append(grape)
        }
    }

}

// MARK: - Page two
struct AddWinePageTwo: View {
    var body: some View {
        VStack{
            Text("page 2")
            
            Spacer()
        }
    }
}

struct CustomTextField: View {
    let label: String
    let example: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
                .lineLimit(1)
            
            HStack{
                TextField(example, text: $text)
                    .font(WineFont.body())
                    .foregroundColor(WineTheme.textPrimary)
                if !text.isEmpty {
                    Button { text = "" } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(WineTheme.placeholder)
                    }
                }
            }
            .padding(.horizontal, 14)
            .frame(height: 40)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.inputRadius)
            .overlay(
                RoundedRectangle(cornerRadius: WineLayout.inputRadius)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
        }
    }
}

#Preview {
    AddWineView()
}
