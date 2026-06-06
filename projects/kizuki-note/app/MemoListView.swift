import SwiftUI
import SwiftData

struct MemoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Memo.createdAt, order: .reverse) private var memos: [Memo]

    @State private var searchText = ""

    private var filteredMemos: [Memo] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return memos
        }
        return memos.filter { memo in
            memo.text.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMemos) { memo in
                    NavigationLink(destination: MemoDetailView(memo: memo)) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(memo.text.isEmpty ? "未入力メモ" : memo.text)
                                .lineLimit(2)
                                .font(.body)

                            Text(memo.createdAt.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: deleteMemos)
            }
            .searchable(text: $searchText, prompt: "メモを検索")
            .navigationTitle("メモ一覧")
        }
    }

    private func deleteMemos(at offsets: IndexSet) {
        for index in offsets {
            let memo = filteredMemos[index]
            modelContext.delete(memo)
        }
    }
}
