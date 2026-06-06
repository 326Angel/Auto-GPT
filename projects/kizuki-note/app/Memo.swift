import Foundation
import SwiftData

@Model
final class Memo {
    var id: UUID
    var text: String
    var createdAt: Date
    var updatedAt: Date

    init(text: String) {
        self.id = UUID()
        self.text = text
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
