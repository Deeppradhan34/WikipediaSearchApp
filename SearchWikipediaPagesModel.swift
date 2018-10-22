//
//  SearchWikipediaPagesModel.swift
//  WikipediaSearchApp
//
//  Created by DEEP PRADHAN on 21/10/18.
//  Copyright © 2018 DEEP PRADHAN. All rights reserved.
//

import Foundation

struct SearchedInformation {
    var page: Pages
}

struct Pages {
    let title: String
    let imageUrl: String
    let description: String
}
