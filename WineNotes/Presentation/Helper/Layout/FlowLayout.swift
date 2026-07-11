import SwiftUI

struct TestFlowLayout: View {
    var body: some View {
        FlowLayout(spacing: 8){
            ForEach(sampleWines) { wine in
                Text(wine.name)
                    .padding(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(WineTheme.inputBorder, lineWidth: 1)
                    )
            }
        }
    }
}

struct TestFlowLayoutTwo: View {
    @State private var list = [1, 2, 3, 5, 6, 8, 9, 11, 123, 13425, 421541, 11, 2145, 4, 1245, 45, 44, 4512, 1254, 5214]
    var body: some View {
        FlowLayout(spacing: 8){
            ForEach(list, id: \.self) { item in
                Text("\(item)")
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(WineTheme.inputBorder, lineWidth: 1)
                    )
            }
        }

    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = computeRows(proposal: proposal, subviews: subviews)
        let height = rows.map { $0.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0 }
            .reduce(0) { $0 + $1 + spacing } - spacing
        return CGSize(width: proposal.width ?? 0, height: max(0, height))
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let rows = computeRows(proposal: proposal, subviews: subviews)
        var y = bounds.minY
        for row in rows {
            var x = bounds.minX
            let rowHeight = row.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0
            for subview in row {
                let size = subview.sizeThatFits(.unspecified)
                subview.place(at: CGPoint(x: x, y: y), proposal: .unspecified)
                x += size.width + spacing
            }
            y += rowHeight + spacing
        }
    }

    private func computeRows(proposal: ProposedViewSize, subviews: Subviews) -> [[LayoutSubview]] {
        let maxWidth = proposal.width ?? .infinity
        var rows: [[LayoutSubview]] = [[]]
        var x: CGFloat = 0

        for subview in subviews {
            let width = subview.sizeThatFits(.unspecified).width
            if x + width > maxWidth, !rows[rows.count - 1].isEmpty {
                rows.append([])
                x = 0
            }
            rows[rows.count - 1].append(subview)
            x += width + spacing
        }
        return rows
    }
}

#Preview {
    TestFlowLayout()
}

#Preview{
    TestFlowLayoutTwo()
}
