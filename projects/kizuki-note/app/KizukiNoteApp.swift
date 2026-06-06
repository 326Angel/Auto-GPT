import SwiftUI
import SwiftData

@main
struct KizukiNoteApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Memo.self)
    }
}
