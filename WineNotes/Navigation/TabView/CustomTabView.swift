
import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    @State private var visitedTabs: Set<Tab> = [.galery]
    @State private var tabId: [Tab: UUID] = Dictionary(uniqueKeysWithValues: Tab.allCases.map{ ($0, UUID()) })
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if visitedTabs.contains(.galery)  { GaleryRootView().id(tabId[.galery]).opacity(selectedTab == .galery    ? 1 : 0) }
                if visitedTabs.contains(.stat)    { StatRootView().id(tabId[.stat]).opacity(selectedTab == .stat          ? 1 : 0) }
                if visitedTabs.contains(.lib)     { LibRootView().id(tabId[.lib]).opacity(selectedTab == .lib             ? 1 : 0) }
                if visitedTabs.contains(.profile) { ProfileRootView().id(tabId[.profile]).opacity(selectedTab == .profile ? 1 : 0) }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            CustomTabBar(selectedTab: selectedTab) { tab in
                tabId[tab] = UUID()
                if !visitedTabs.contains(tab) { visitedTabs.insert(tab) }
                selectedTab = tab
                
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}
