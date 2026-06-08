
import SwiftUI

struct CustomTabBar: View {
    let selectedTab: Tab
    let onSelect: (Tab) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(tab: .galery,  title: "Galery",     icon: "house",           selectedIcon: "house.fill",      selectedTab: selectedTab, onSelect: onSelect)
            TabBarButton(tab: .stat,    title: "Statistics", icon: "gear",            selectedIcon: "gear",            selectedTab: selectedTab, onSelect: onSelect)
            TabBarButton(tab: .lib,     title: "Library",    icon: "magnifyingglass", selectedIcon: "magnifyingglass", selectedTab: selectedTab, onSelect: onSelect)
            TabBarButton(tab: .profile, title: "Profile",    icon: "person",          selectedIcon: "person.fill",     selectedTab: selectedTab, onSelect: onSelect)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
        .background(.background)
    }
}

private struct TabBarButton: View {
    let tab: Tab
    let title: String
    let icon: String
    let selectedIcon: String
    
    let selectedTab: Tab
    let onSelect: (Tab) -> Void
    
    private var isSelected: Bool { selectedTab == tab }
    
    var body: some View {
        Button {
            onSelect(tab)
        } label: {
            VStack(spacing: 4) {
                Image(systemName: isSelected ? selectedIcon : icon)
                    .font(.system(size: 22, weight: .medium))
                Text(title)
                    .font(.caption2)
                    .fontWeight(isSelected ? .semibold : .regular)
            }
            .foregroundStyle(isSelected ? .blue : .secondary)
            .frame(maxWidth: .infinity)
            .animation(.easeInOut(duration: 0.15), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}
