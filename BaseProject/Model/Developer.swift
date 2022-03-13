//
//  Developer.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 12/03/22.
//

import Foundation

typealias Developer = GetDevelopersResponse.Developer

extension Developer: TitleTableViewDataSource {
    var title: String {
        return name
    }
}
