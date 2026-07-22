import SwiftUI

struct CustomTextField: View {
    let label: String
    let example: String
    @Binding var text: String
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
                TextField(example, text: $text)
                    .font(WineFont.body())
                    .foregroundColor(WineTheme.textPrimary)
                    .frame(height: height, alignment: height == 40 ? .center : .topLeading)
//                if !text.isEmpty {
//                    Button { text = "" } label: {
//                        Image(systemName: "xmark.circle.fill").foregroundColor(WineTheme.placeholder)
//                    }
//                }
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



#Preview {
    CustomTextField(label: "Цена", example: "asdfasdfasdf", text: .constant(""), height: 80)
}
