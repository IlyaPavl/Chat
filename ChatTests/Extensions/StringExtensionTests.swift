import Testing
@testable import Chat

// @Suite groups related tests under one readable name in Xcode's Test navigator.
@Suite("String+Extension: firstWord")
struct StringExtensionTests {

    // @Test marks a test function — auto-discovered, no naming convention required.
    @Test("Returns the whole string when there is only one word")
    func singleWord() {
        // Arrange
        let input = "Hello"
        // Act
        let result = input.firstWord
        // Assert — #expect records a failure but keeps running the rest of the test.
        #expect(result == "Hello")
    }

    @Test("Returns the first word when there are multiple words")
    func multipleWords() {
        #expect("Hello world".firstWord == "Hello")
    }

    @Test("Returns an empty string when input is empty")
    func emptyString() {
        #expect("".firstWord == "")
    }

    @Test("Ignores extra spaces between words")
    func multipleSpacesBetweenWords() {
        #expect("Hello   world".firstWord == "Hello")
    }

    @Test("Ignores leading spaces before the first word")
    func leadingSpaces() {
        #expect("   Hello world".firstWord == "Hello")
    }

    @Test("Returns an empty string when input is only whitespace")
    func allWhitespace() {
        #expect("    ".firstWord == "")
    }

    // @Test(arguments:) runs the same body once per entry — a parameterized test,
    // instead of copy-pasting near-identical test functions.
    @Test("firstWord across various inputs", arguments: [
        ("one two three", "one"),
        ("  padded start", "padded"),
        ("trailing space   ", "trailing"),
        ("singleword", "singleword"),
    ])
    func variousInputs(input: String, expected: String) {
        #expect(input.firstWord == expected)
    }
}
