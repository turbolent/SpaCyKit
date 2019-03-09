import XCTest
import SpaCyKit
import PythonKit
import Foundation

final class SpaCyKitTests: XCTestCase {

    func testWithParser() {
        let language = Language.load(name: "en")
        XCTAssertEqual(language.pipeNames, ["tagger", "parser", "ner"])
        let doc = language.apply(text: "who wrote 1984")
        XCTAssert(doc.isParsed)
        XCTAssert(doc.isTagged)
        XCTAssertEqual(doc.count, 3)
        XCTAssertEqual(
            [
                ["who", "who", "NOUN", "WP", "xxx", "nsubj"],
                ["wrote", "write", "VERB", "VBD", "xxxx", "ROOT"],
                ["1984", "1984", "NUM", "CD", "dddd", "npadvmod"]
            ],
            doc.map { token in
                [token.text, token.lemma, token.pos, token.tag, token.shape, token.dependencyLabel]
            }
        )

        XCTAssertEqual(
            [
                [false, true, true],
                [false, false, true],
                [false, false, false]
            ],
            doc.map { token in
                [token.isPunctuation, token.isStop, token.isAlpha]
            }
        )
    }

    func testWithoutParser() {
        let language = Language.load(name: "en", disable: ["ner"])
        language.removePipe(name: "parser")
        XCTAssertEqual(language.pipeNames, ["tagger"])
        let doc = language.apply(text: "who wrote 1984")
        XCTAssertFalse(doc.isParsed)
        XCTAssert(doc.isTagged)
        XCTAssertEqual(doc.count, 3)
        XCTAssertEqual(
            [
                ["who", "who", "NOUN", "WP", "xxx", ""],
                ["wrote", "write", "VERB", "VBD", "xxxx", ""],
                ["1984", "1984", "NUM", "CD", "dddd", ""]
            ],
            doc.map { token in
                [token.text, token.lemma, token.pos, token.tag, token.shape, token.dependencyLabel]
            }
        )

        XCTAssertEqual(
            [
                [false, true, true],
                [false, false, true],
                [false, false, false]
            ],
            doc.map { token in
                [token.isPunctuation, token.isStop, token.isAlpha]
            }
        )
    }
}
