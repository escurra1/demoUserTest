//
//  PostListInteractor.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation
import Alamofire

protocol PostListInteractorProtocol: AnyObject {
    func getPostList(userId: Int)
    var presenter: PostListPresenterProtocol? { get set }
}

class PostListInteractor: PostListInteractorProtocol {
    weak var presenter: PostListPresenterProtocol?
    func getPostList(userId: Int) {
        guard let url = URL(string: Constants.Urls.baseUrl + Constants.Urls.posts + "\(userId)") else {
            return
        }
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default, headers: nil)
        let decodableResponse = [PostResponse].self
        request.responseDecodable(of: decodableResponse) { response in
            switch response.result {
            case .success(let response):
                self.presenter?.didShowPostList(postList: response, userId: userId)
            case .failure(let error):
                self.presenter?.goToErrorGeneric()
                debugPrint("\(error.localizedDescription)")
            }
        }
    }
    
}
