import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go!") {
                    Text("Next Screen")
                        .modifier(ApplyToAllViews())
                }
            }
            .padding()
        }
        .modifier(ApplyToAllViews())
    }
}


struct ApplyToAllViews: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                        Button(action:{
                            dismiss()
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 2)
                                Image(systemName: "chevron.backward")
                            }
                            .frame(width:40, height:40)
                        }
                }
            }
    }
}

#Preview {
    ContentView()
}
