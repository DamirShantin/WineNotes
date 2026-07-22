
import SwiftUI

struct GaleryMainView:  View {
    
    @State private var searchText: String = ""
    @State private var selectedType: WineType? = nil
    @State private var selectedStatus: WineStatus? = nil
    @State private var showAddWine: Bool = false
    
    private var filteredWines: [Wine] {
        sampleWines.filter { wine in
            let matchSearch = searchText.isEmpty ||
                wine.name.localizedCaseInsensitiveContains(searchText) ||
                wine.region.localizedCaseInsensitiveContains(searchText) ||
                wine.country.localizedCaseInsensitiveContains(searchText)
            let matchType = selectedType == nil || wine.type == selectedType
            let matchStatus = selectedStatus == nil || wine.status == selectedStatus
            return matchSearch && matchType && matchStatus
        }
    }

    
    var body: some View {
        VStack{
            
            header
                .padding(.horizontal, WineLayout.paddingHorizontal)
            
            searchBar
                .padding(.horizontal, WineLayout.paddingHorizontal)
            
            typeFilterRow
                .padding(.top, 4)
            
            statusFilterRow
                .padding(.bottom, 8)
            
            wineList
            
        }
        
        
        
    }
    
    // MARK: - Header
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Коллекция")
                    .font(WineFont.titleLarge())
                    .foregroundColor(WineTheme.textPrimary)
                Text("\(sampleWines.count) вин · \(sampleWines.count) выпито")
                    .font(WineFont.caption())
                    .foregroundColor(WineTheme.textSecondary)
            }
            Spacer()
            Button {
                showAddWine = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .fill(WineTheme.burgundy)
                            .frame(width: 30, height: 30)
                    )
            }
        }
    }
    
    // MARK: - Search
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16))
                .foregroundColor(WineTheme.placeholder)
            TextField("Поиск вина...", text: $searchText)
                .font(WineFont.body())
                .foregroundColor(WineTheme.textPrimary)
            if !searchText.isEmpty {
                Button { searchText = "" } label: {
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
    
    // MARK: - Type Filter
    private var typeFilterRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip(label: "Все", isActive: selectedType == nil) {
                    selectedType = nil
                }
                ForEach(WineType.allCases, id: \.self) { type in
                    typeChip(type: type)
                }
            }
            .padding(.horizontal, WineLayout.paddingHorizontal)
        }
    }

    private func typeChip(type: WineType) -> some View {
        let isActive = selectedType == type
        return Button {
            selectedType = isActive ? nil : type
        } label: {
            HStack(spacing: 5) {
                Circle()
                    .fill(WineTheme.typeDotColor(type))
                    .frame(width: 8, height: 8)
                Text(type.displayName)
                    .font(WineFont.captionMedium())
            }
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(isActive ? WineTheme.burgundy : WineTheme.filterBg)
            .foregroundColor(isActive ? .white : WineTheme.textPrimary)
            .cornerRadius(20)
        }
    }

    private func filterChip(label: String, isActive: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(WineFont.captionMedium())
                .padding(.horizontal, 14)
                .frame(height: 32)
                .background(isActive ? WineTheme.burgundy : WineTheme.filterBg)
                .foregroundColor(isActive ? .white : WineTheme.textPrimary)
                .cornerRadius(20)
        }
    }
    
    // MARK: - Status Filter
    private var statusFilterRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip(label: "Все статусы", isActive: selectedStatus == nil) {
                    selectedStatus = nil
                }
                ForEach(WineStatus.allCases, id: \.self) { status in
                    filterChip(label: status.displayName, isActive: selectedStatus == status) {
                        selectedStatus = selectedStatus == status ? nil : status
                    }
                }
            }
            .padding(.horizontal, WineLayout.paddingHorizontal)
        }
    }
    
    // MARK: wine list
    
    @ViewBuilder
    private var wineList: some View{
        ZStack{
            WineTheme.background
            
            if filteredWines.isEmpty {
                emptyState
            } else {
                ScrollView {
                    LazyVStack(spacing: WineLayout.cardSpacing) {
                        ForEach(filteredWines) { wine in
                            WineCardView(wine: wine)
                        }
                    }
                    .padding(.horizontal, WineLayout.paddingHorizontal)
                    .padding(.vertical, 16)
                }
            }
        }
    }
    
    
    // MARK: - Empty State
    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "wineglass")
                .font(.system(size: 48, weight: .thin))
                .foregroundColor(WineTheme.textSecondary.opacity(0.4))
            Text("Вина не найдены")
                .font(WineFont.titleMedium())
                .foregroundColor(WineTheme.textPrimary)
            Text("Попробуйте изменить фильтры\nили добавьте новое вино")
                .font(WineFont.body())
                .foregroundColor(WineTheme.textSecondary)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
    
    
}

#Preview {
    GaleryMainView()
}
