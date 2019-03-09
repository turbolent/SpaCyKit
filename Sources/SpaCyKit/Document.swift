import PythonKit


public struct Document {

    internal let spacyDocument: PythonObject

    internal init(spacyDocument: PythonObject) {
        self.spacyDocument = spacyDocument
    }

    public var isTagged: Bool {
        return Bool(spacyDocument.is_tagged)!
    }

    public var isParsed: Bool {
        return Bool(spacyDocument.is_parsed)!
    }

    public var count: Int {
        return spacyDocument.count
    }
}


extension Document: Collection {

    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return spacyDocument.count
    }

    public func index(after i: Int) -> Int {
        return i + 1
    }

    public subscript(index: Int) -> Token {
        return Token(spacyToken: spacyDocument[index.pythonObject])
    }
}


extension Document: CustomStringConvertible {
    public var description: String {
        return String(Python.str(spacyDocument))!
    }
}
