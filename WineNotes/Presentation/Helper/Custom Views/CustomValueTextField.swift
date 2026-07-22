import SwiftUI


struct CustomValueTextField: View {
    let label: String
    let example: String
    @Binding var value: Int
    var height: CGFloat = 40
    var showDeleteButton: Bool = false // test
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
                .lineLimit(1)
            
            HStack{
                TextField(example, text: Binding(
                    get: { String(value)},
                    set: { value = Int($0)! })
                )
                    .font(WineFont.body())
                    .foregroundColor(WineTheme.textPrimary)
                    .frame(height: height, alignment: height == 40 ? .center : .topLeading)
                    .keyboardType(.numberPad)
               
            }
            .padding(.horizontal, 14)
//            .frame(height: height)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.inputRadius)
            .overlay(
                RoundedRectangle(cornerRadius: WineLayout.inputRadius)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
        }
    }
}
