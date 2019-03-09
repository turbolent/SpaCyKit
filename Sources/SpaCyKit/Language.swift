import PythonKit


public let spacy = Python.import("spacy")


public struct Language {

    private let spacyLanguage: PythonObject

    private init(spacyLanguage: PythonObject) {
        self.spacyLanguage = spacyLanguage
    }

    public static func load(name: String, disable: [String] = []) -> Language {
        return Language(spacyLanguage: spacy.load(name, disable: disable))
    }

    public var pipeNames: [String] {
        return spacyLanguage.pipe_names.map { String($0)! }
    }

    public func removePipe(name: String) {
        spacyLanguage.remove_pipe(name)
    }

    public func apply(text: String, disable: [String] = []) -> Document {
        let spacyDocument = spacyLanguage(text, disable: disable)
        return Document(spacyDocument: spacyDocument)
    }
}
