//
//  URL.swift
//  CodeConf_iOS
//
//  Created by Pawel Madej on 20/08/2020.
//  Copyright © 2020 Pawel Madej. All rights reserved.
//
//
//  Created by Pawel Madej on 20/08/2020.
//

import Foundation

extension URL {
    var isDeeplink: Bool {
        return scheme == "testlink"
    }

    var sectionIdentifier: SectionIdentifier? {
        guard isDeeplink else { return nil }

        switch host {
            case "talks": return .talks
            case "speakers": return .speakers
            default: return nil
        }
    }

    var detailPage: PageIdentifier? {
        guard let sectionIdentifier = sectionIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else {
            return nil
        }

        switch sectionIdentifier {
            case .talks: return .talk(id: uuid)
            default: return nil
        }
    }
}
