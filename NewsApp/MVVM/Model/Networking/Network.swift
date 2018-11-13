//
//  Network.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
import Himotoki

/**
 enum for all http methods
 */

enum NetworkMethod {
    case get, post, put, delete
}

/**
 protocol to make a http request and return decodable model.
 */

protocol Networking {
    
    /**
     protocol method to fetch JSON from http request and decode it using 'Himotoki' Pod.
     It uses Alamofire Pod for Networking.
     
     - returns:
        return Observable of type Himotoki.Decodable which emit an event when the request is finished.
     
     - parameters:
        - method: enum case from NetworkMethod (Http Method).
        - url: The http request end point path which contins the path and the query string params.
        - parameters : the http requst body params.
        - type : decoadable class type to cast JSON results
     
     */
    
    func request<D: Himotoki.Decodable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type) -> Observable<D>
    
    
    /**
     protocol method to fetch JSON from http request and return general object.
     It uses Alamofire Pod for Networking.
     
     - returns:
     return Observable of type Any which emit an event when the request is finished.
     
     - parameters:
        - method: enum case from NetworkMethod (Http Method).
        - url: The http request end point path which contins the path and the query string params.
        - parameters : the http requst body params.
     */
    
    func request(method: NetworkMethod, url: String, parameters: [String : Any]?) -> Observable<Any>
}

/**
 Network class used to implement Networking protocol and do the http request using Alamofire Pod and decoade JSON into models by Himotoki Pod.
 */

final class Network: Networking {
    private let queue = DispatchQueue(label: "news.Network.Queue")
    
    func request<D: Himotoki.Decodable>(method: NetworkMethod, url: String, parameters: [String : Any]?, type: D.Type) -> Observable<D> {
        return request(method: method, url: url, parameters: parameters)
            .map {
                do {
                    return try D.decodeValue($0)                    
                } catch {
                    throw NetworkError.IncorrectDataReturned
                }
        }
    }
    
    func request(method: NetworkMethod, url: String, parameters: [String : Any]?) -> Observable<Any> {
        return Observable.create { observer in
            let method = method.httpMethod()
            
            let request = Alamofire.request(url, method: method, parameters: parameters)
                .validate()
                .responseJSON(queue: self.queue) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(NetworkError(error: error))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

/**
 NetworkMethod extension to do the maping between NetworkMethod enum to Alamofire HTTPMethod enum.
 */

fileprivate extension NetworkMethod {
    func httpMethod() -> HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}
