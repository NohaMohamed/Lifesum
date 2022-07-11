//
//  AlamofireExtension.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 07/07/2022.
//

import Foundation
import Alamofire
struct AlamofireRequest: URLRequestConvertible {
    
    var request: RequestProtocol
    
    init(_ request: RequestProtocol) {
        self.request = request
    }
    
    func asURLRequest() throws -> URLRequest {
        if let url = URL(string: request.baseURL+request.endPoint) {
            var urlRequest = URLRequest(url: url)
            let method = request.method
            urlRequest.httpMethod = method.rawValue
            
            if method == .get {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: request.parameters)
                return urlRequest
            }
            
            return urlRequest
        }
        return URLRequest(url: URL(string: "")!)
    }
}
extension Session {
    func request(_ request: RequestProtocol) -> DataRequest {
        let AlamofireRequest = AlamofireRequest(request)
        let mappedRequest = try! AlamofireRequest.asURLRequest()
        return self.request(mappedRequest)
    }
}
extension DataRequest {
    @discardableResult
    func responseObject<ResponsType: BaseModel>(compeletion: @escaping (Result<ResponsType, CustomError>) -> Void) -> Self {
        
        responseString { response in
            
            switch response.result {
            case .success(let jsonString):
                
                debugPrint(jsonString)
                guard let jsonData = jsonString.data(using: .utf8),
                      let model = try? JSONDecoder().decode(ResponsType.self, from: jsonData)
                else {
                    compeletion(Result.failure(.canNotDecodeObject))
                    return
                }
                if model.meta.code == ErrorCodes.sucess.rawValue {
                    compeletion(Result.success(model))
                }else{
                    compeletion(Result.failure(.generic))
                }
                
            case .failure(let error):
                
                compeletion(Result.failure(CustomError(error: error)))
                
            }
        }
    }
}
