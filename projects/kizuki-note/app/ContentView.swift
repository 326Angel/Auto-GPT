import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            MemoInputView()
                .tabItem {
                    Label("入力", systemImage: "square.and.pencil")
                }

            MemoListView()
                .tabItem {
                    Label("一覧", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
