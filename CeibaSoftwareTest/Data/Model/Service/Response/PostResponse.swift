//
//  PostResponse.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

// MARK: - PostResponse
struct PostResponse: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
