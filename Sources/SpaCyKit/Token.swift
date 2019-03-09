import PythonKit


public struct Token {

    private let spacyToken: PythonObject

    internal init(spacyToken: PythonObject) {
        self.spacyToken = spacyToken
    }

    public var index: Int {
        return Int(spacyToken.idx)!
    }

    public var text: String {
        return String(spacyToken.text)!
    }

    public var lemma: String {
        return String(spacyToken.lemma_)!
    }

    public var pos: String {
        return String(spacyToken.pos_)!
    }

    public var tag: String {
        return String(spacyToken.tag_)!
    }

    public var shape: String {
        return String(spacyToken.shape_)!
    }

    public var dependencyLabel: String {
        return String(spacyToken.dep_)!
    }

    public var isAlpha: Bool {
        return Bool(spacyToken.is_alpha)!
    }

    public var isStop: Bool {
        return Bool(spacyToken.is_stop)!
    }

    public var isPunctuation: Bool {
        return Bool(spacyToken.is_punct)!
    }
}


extension Token: CustomStringConvertible {

    public var description: String {
        return String(Python.str(spacyToken))!
    }
}

