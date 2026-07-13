import Testing
@testable import Chat

// @MainActor on the suite applies main-actor isolation to every test inside it —
// required because ChatListStore itself is @MainActor.
@MainActor
@Suite("ChatListStore behavior")
struct ChatListStoreTests {

    // Small helper fixture, built fresh per test — keeps each test self-contained.
    private func makeChat(
        username: String,
        lastMessage: String,
        state: ChatListState
    ) -> ChatListModel {
        ChatListModel(
            username: username,
            lastMessage: lastMessage,
            state: state
        )
    }

    @Test("On init, chats are split into waiting/active with no filtering")
    func initialState() {
        let chats = [
            makeChat(username: "Anna", lastMessage: "Hi!", state: .waiting),
            makeChat(username: "Bob", lastMessage: "See you", state: .active),
        ]
        let store = ChatListStore(chats: chats)

        #expect(store.waitingChats.count == 1)
        #expect(store.activeChats.count == 1)
        #expect(store.waitingChats.first?.username == "Anna")
        #expect(store.activeChats.first?.username == "Bob")
    }

    @Test("Empty search text shows the full unfiltered list")
    func emptySearchTextShowsEverything() {
        let chats = [
            makeChat(username: "Anna", lastMessage: "Hi!", state: .waiting),
            makeChat(username: "Bob", lastMessage: "See you", state: .active),
        ]
        let store = ChatListStore(chats: chats)

        store.searchText = "Anna"
        store.searchText = "" // reset

        #expect(store.waitingChats.count == 1)
        #expect(store.activeChats.count == 1)
    }

    @Test("Search with no matches yields empty results")
    func searchWithNoMatches() {
        let store = ChatListStore(chats: [
            makeChat(username: "Anna", lastMessage: "Hi!", state: .waiting),
        ])

        store.searchText = "zzz_no_such_chat_zzz"

        #expect(store.waitingChats.isEmpty)
        #expect(store.activeChats.isEmpty)
    }

    @Test("Search matches by username, case-insensitively")
    func searchMatchesUsername() {
        let store = ChatListStore(chats: [
            makeChat(username: "Anna", lastMessage: "Hi!", state: .waiting),
            makeChat(username: "Bob", lastMessage: "See you", state: .active),
        ])

        store.searchText = "anna" // lowercase on purpose

        #expect(store.waitingChats.count == 1)
        #expect(store.activeChats.isEmpty)
    }

    @Test("Search matches by lastMessage too")
    func searchMatchesLastMessage() {
        let store = ChatListStore(chats: [
            makeChat(username: "Anna", lastMessage: "Let's meet tomorrow", state: .waiting),
            makeChat(username: "Bob", lastMessage: "See you", state: .active),
        ])

        store.searchText = "tomorrow"

        #expect(store.waitingChats.count == 1)
        #expect(store.activeChats.isEmpty)
    }
}
