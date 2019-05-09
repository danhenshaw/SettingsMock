//
//  Language.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import Foundation

enum Language: CaseIterable {
    
    case arabic, azerbaijani, belarusian, bosnian, catalan, czech, german, greek, english ,spanish, estonian, french, croatian, hungarian, indonesian, italian, icelandic, cornish, norwegianBokmål, dutch, polish, portuguese, russian, slovak, slovenian, serbian, swedish, tetum, turkish, ukrainian, pigLatin, simplifiedChinese, traditionalChinese
    
    public var longName: String {
        switch self {
        case .arabic : return "arabic"
        case .azerbaijani : return "azerbaijani"
        case .belarusian : return "belarusian"
        case .bosnian : return "bosnian"
        case .catalan : return "catalan"
        case .czech : return "czech"
        case .german : return "german"
        case .greek : return "greek"
        case .english : return "english"
        case .spanish : return "spanish"
        case .estonian : return "estonian"
        case .french : return "french"
        case .croatian : return "croatian"
        case .hungarian : return "hungarian"
        case .indonesian : return "indonesian"
        case .italian : return "italian"
        case .icelandic : return "icelandic"
        case .cornish : return "cornish"
        case .norwegianBokmål : return "norwegian bokmål"
        case .dutch : return "dutch"
        case .polish : return "polish"
        case .portuguese : return "portuguese"
        case .russian : return "russian"
        case .slovak : return "slovak"
        case .slovenian : return "slovenian"
        case .serbian : return "serbian"
        case .swedish : return "swedish"
        case .tetum : return "tetum"
        case .turkish : return "turkish"
        case .ukrainian : return "ukrainian"
        case .pigLatin : return "pig latin"
        case .simplifiedChinese : return "chinese (simplified)"
        case .traditionalChinese : return "chinese (traditional)"
        }
    }

    public var shortName: String {
        switch self {
        case .arabic : return "ar"
        case .azerbaijani : return "az"
        case .belarusian : return "be"
        case .bosnian : return "bs"
        case .catalan : return "ca"
        case .czech : return "cs"
        case .german : return "de"
        case .greek : return "el"
        case .english : return "en"
        case .spanish : return "es"
        case .estonian : return "et"
        case .french : return "fr"
        case .croatian : return "hr"
        case .hungarian : return "hu"
        case .indonesian : return "id"
        case .italian : return "it"
        case .icelandic : return "is"
        case .cornish : return "kw"
        case .norwegianBokmål : return "nb"
        case .dutch : return "nl"
        case .polish : return "pl"
        case .portuguese : return "pt"
        case .russian : return "ru"
        case .slovak : return "sk"
        case .slovenian : return "sl"
        case .serbian : return "sr"
        case .swedish : return "sv"
        case .tetum : return "tet"
        case .turkish : return "tr"
        case .ukrainian : return "uk"
        case .pigLatin : return "x-pig-latin"
        case .simplifiedChinese : return "zh"
        case .traditionalChinese : return "zh-tw"
        }
    }
}
