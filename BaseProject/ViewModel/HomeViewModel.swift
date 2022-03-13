//
//  HomeViewModel.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 12/03/22.
//

import Foundation

struct HomeViewModel {
    var onDeveloperUpdated: (([Developer]) -> Void)?
    var onNetworkFailure: ((Error) -> Void)?
    
    func fetchDevelopers() {
        URLSession.shared.dataTask(
            with: URL(string: "http://localhost:8080/developers")!,
            completionHandler: { data, response, error in
                guard
                    error == nil,
                    let data = data else {
                        print(error ?? "Unknown error")
                        onNetworkFailure?(error!)
                        return
                    }
                
                onDeveloperUpdated?(try! GetDevelopersResponse(serializedData: data).developers)
            }
        ).resume()
    }
}
