//
//  ListUserInteractor.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation
import Alamofire

protocol ListUserInteractorProtocol: AnyObject {
    func getListUsers()
    var presenter: ListUserPresenterProtocol? { get set }
}

class ListUserInteractor: ListUserInteractorProtocol {
    weak var presenter: ListUserPresenterProtocol?
    func getListUsers() {
        guard let url = URL(string: Constants.Urls.baseUrl + Constants.Urls.users) else {
            return
        }
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default, headers: nil)
        let decodableResponse = [UserResponse].self
        request.responseDecodable(of: decodableResponse) { response in
            switch response.result {
            case .success(let response):
                self.presenter?.didShowListUser(listUser: response)
            case .failure(let error):
                self.presenter?.goToErrorGeneric()
                debugPrint("\(error.localizedDescription)")
            }
        }
    }
    
}
