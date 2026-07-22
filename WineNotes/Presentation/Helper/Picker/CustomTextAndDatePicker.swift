
import SwiftUI

struct CustomTextAndDatePicker: View {
    let label: String
    @State private var isPresented = false
    @Binding var selectedDate: Date
    var height: CGFloat = 40
    var customFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM yyyy"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .textCase(.uppercase)
                .font(WineFont.bodySemibold(12))
                .foregroundColor(WineTheme.textButton)
                .lineLimit(1)
            HStack{
                Text(customFormatter.string(from: selectedDate))
                    .font(WineFont.body())
                    .foregroundColor(WineTheme.textPrimary)
                    .frame(height: height, alignment: height == 40 ? .center : .topLeading)
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "calendar")
                        .foregroundStyle(WineTheme.burgundy)
                }
            }
            .padding(.horizontal, 14)
//            .frame(height: height)
            .background(WineTheme.cardBackground)
            .cornerRadius(WineLayout.inputRadius)
            .overlay(
                RoundedRectangle(cornerRadius: WineLayout.inputRadius)
                    .stroke(WineTheme.inputBorder, lineWidth: 1)
            )
            .sheet(isPresented: $isPresented) {
                VStack{
                    HStack{
                        Spacer()
                        Button{
                            isPresented = false
                        }label: {
                            Text("Готово")
                                .font(WineFont.bodyMedium())
                                .foregroundStyle(WineTheme.burgundy)
                        }
                    }
                    .padding(.trailing, 24)
                    .padding(.top, 20)
                    DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .foregroundStyle(WineTheme.burgundy)
                }
                    .presentationDetents([.medium])
            }
            
        }
    }
}

#Preview {
    CustomTextAndDatePicker(label: "Дата", selectedDate: .constant(Date()))
}
