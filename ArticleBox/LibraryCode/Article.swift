//
// Created by Ladislav Lisy on 10.04.16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

public class Article: Equatable, Comparable, CustomDebugStringConvertible
{
    private let code: ConfigArticleCode;

    private let category : ProcessCategory;

    private let pendingCodes: Array<ConfigArticleCode>;

    init (code: ConfigArticleCode, catg: ProcessCategory, pendings: Array<ConfigArticleCode>)
    {
        self.code = code;

        self.category = catg;

        self.pendingCodes = pendings;
    }

    public func articleCode() -> ConfigArticleCode {
        return self.code;
    }

    public func articlePendings() -> Array<ConfigArticleCode> {
        return self.pendingCodes;
    }

    public var debugDescription: String {
        return "\(code.rawValue)";
    }

    func compareTo(other: Article) -> Int {
        return code.rawValue - other.code.rawValue;
    }

}

public func == (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) == 0);
}

public func != (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) != 0);
}

public func > (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) > 0);
}

public func >= (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) >= 0);
}

public func < (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) < 0);
}

public func <= (first: Article, other: Article) -> Bool {
    return (first.compareTo(other) <= 0);
}

