//
// InlineResponse500.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct InlineResponse500: Codable {

    public var statusCode: Int?
    public var message: String?
    public var errorCode: Int?

    public init(statusCode: Int?, message: String?, errorCode: Int?) {
        self.statusCode = statusCode
        self.message = message
        self.errorCode = errorCode
    }

    public enum CodingKeys: String, CodingKey { 
        case statusCode = "status_code"
        case message
        case errorCode = "error_code"
    }


}
