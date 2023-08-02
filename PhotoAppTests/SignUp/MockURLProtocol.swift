//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 02/08/2023.
//

import Foundation



class MockUrlProtocol:URLProtocol {
    
    static var stubResponseData:Data? // STUB RESPONSE DATA WHAT I WILL INJECT
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        self.client?.urlProtocol(self, didLoad: MockUrlProtocol.stubResponseData ?? Data())
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
