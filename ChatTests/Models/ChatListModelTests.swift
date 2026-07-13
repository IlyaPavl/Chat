import Testing
@testable import Chat

@Suite("ChatListModel.mock invariants")
struct ChatListModelTests {

    @Test("mock contains exactly 51 entries")
    func mockCount() {
        #expect(ChatListModel.mock.count == 52)
    }

    @Test("mock has exactly 10 waiting chats and 41 active chats")
    func mockWaitingActiveSplit() {
        let waitingCount = ChatListModel.mock.filter { $0.state == .waiting }.count
        let activeCount = ChatListModel.mock.filter { $0.state == .active }.count

        #expect(waitingCount == 10)
        #expect(activeCount == 42)
    }

    @Test("Every mock chat has a non-empty username")
    func mockUsernamesNotEmpty() {
        #expect(ChatListModel.mock.allSatisfy { !$0.username.isEmpty })
    }
}
