//
//  SectionIdentifier.swift
//  CodeConf_iOS
//
//  Created by Pawel Madej on 22/08/2020.
//  Copyright © 2020 Pawel Madej. All rights reserved.
//

import Foundation

enum SectionIdentifier: Hashable {
    case talks, speakers

    var icon: String {
        switch self {
            case .talks:
                return "tv"
            case .speakers:
                return "person.fill"
        }
    }

    var title: String {
        switch self {
            case .talks:
                return "Talks"
            case .speakers:
                return "Speakers"
        }
    }
}
