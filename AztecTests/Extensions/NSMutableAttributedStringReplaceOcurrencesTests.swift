import Foundation
import XCTest


class NSMutableAttributedStringReplaceOcurrencesTests: XCTestCase {

    // MARK: - Test replacing a string that doesn't exist in the original attrString

    /// Tests that replacing ocurrences of a string that doesn't exist in the original attrString
    /// doesn't cause the final attrString to change.
    ///
    func testReplaceOcurrencesWithoutMatches1() {
        let attrString = NSMutableAttributedString(string: "Hello 🌎 World!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "🍎", with: "Ahoi!")

        XCTAssertEqual(newAttrString, attrString)
    }

    /// Tests that replacing ocurrences of a string that doesn't exist in the original attrString
    /// doesn't cause the final attrString to change.
    ///    
    func testReplaceOcurrencesWithoutMatches2() {
        let attrString = NSMutableAttributedString(string: "Hello 🌎 World!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "", with: "Ahoi!")

        XCTAssertEqual(newAttrString, attrString)
    }

    // MARK: - Test replacing a string that exists once in the original attrString

    /// Tests that replacing ocurrences of a string that shows up once in the original string
    /// works.
    ///
    func testReplaceOcurrencesThatAppearOnce1() {
        let attrString = NSMutableAttributedString(string: "Hello 🌎 World!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "🌎 ", with: "")

        XCTAssertEqual(newAttrString, NSAttributedString(string: "Hello World!"))
    }


    /// Tests that replacing ocurrences of a string that shows up once in the original string
    /// works.
    ///
    func testReplaceOcurrencesThatAppearOnce2() {
        let attrString = NSMutableAttributedString(string: "Hello 🌎 World!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "Hello ", with: "")

        XCTAssertEqual(newAttrString, NSAttributedString(string: "🌎 World!"))
    }


    /// Tests that replacing ocurrences of a string that shows up once in the original string
    /// works.
    ///
    func testReplaceOcurrencesThatAppearOnce3() {
        let attrString = NSMutableAttributedString(string: "Hello 🌎 World!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: " World!", with: "")

        XCTAssertEqual(newAttrString, NSAttributedString(string: "Hello 🌎"))
    }

    // MARK: - Test replacing a string that exists once in the original attrString

    /// Tests that replacing ocurrences of a string that shows up more than once in the original
    /// string works.
    ///
    func testReplaceOcurrencesThatAppearMoreThanOnce1() {
        let attrString = NSAttributedString(string: "Hello 🌎, Hello World! Hello There!")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "Hello ", with: "")

        XCTAssertEqual(newAttrString, NSAttributedString(string: "🌎, World! There!"))
    }

    /// Tests that replacing ocurrences of a string that shows up more than once in the original
    /// string works.
    ///
    func testReplaceOcurrencesThatAppearMoreThanOnce2() {
        let attrString = NSAttributedString(string: "🌎🍎🍎😬🍎🌎")
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: "🍎", with: "💚")

        XCTAssertEqual(newAttrString, NSAttributedString(string: "🌎💚💚😬💚🌎"))
    }

    /// Tests that replacing ocurrences on the end of a range work correctly
    ///
    func testReplaceOcurrencesThatAreOnEndOfRange() {
        let attrString = NSAttributedString(string: "Hello"+String(.paragraphSeparator)+"Amazing"+String(.paragraphSeparator)+"World"+String(.paragraphSeparator))
        let newAttrString = NSMutableAttributedString(attributedString: attrString)
        newAttrString.replaceOcurrences(of: String(.paragraphSeparator), with: String(.lineFeed), within: NSRange(location:6, length: 8))

        XCTAssertEqual(newAttrString, NSAttributedString(string: "Hello"+String(.paragraphSeparator)+"Amazing"+String(.lineFeed)+"World"+String(.paragraphSeparator)))
    }
}
