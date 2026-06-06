import SwiftUI
import SwiftData

struct MemoDetailView: View {

    @Environment(\.dismiss) private var dismiss
    @Bindable var memo: Memo

    var body: some View {
        VStack {
            TextEditor(text: $memo.text)
                .padding()
        }
        .navigationTitle("メモ詳細")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("完了") {
                    memo.updatedAt = Date()
                    dismiss()
                }
            }
        }
    }
}
