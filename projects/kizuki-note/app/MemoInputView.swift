import SwiftUI
import SwiftData

struct MemoInputView: View {

    @Environment(\\.modelContext) private var modelContext

    @State private var memoText = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $memoText)
                    .padding()

                Button("保存") {
                    let memo = Memo(text: memoText)
                    modelContext.insert(memo)
                    memoText = ""
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("気づき帳")
        }
    }
}
