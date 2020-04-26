//
// Station.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Station: Codable {

    public var id: Int?
    public var name: String?
    public var latitude: Double?
    public var longtitude: Double?
    /** Icon ID for the specific station */
    public var icon: Int?
    public var address: String?
    public var city: String?
    public var openHours: String?
    /** Name of the provider */
    public var provider: String?
    public var pictures: [String]?
    public var evses: [EVSE]?
    public var alertMessage: String?

    public init(id: Int?, name: String?, latitude: Double?, longtitude: Double?, icon: Int?, address: String?, city: String?, openHours: String?, provider: String?, pictures: [String]?, evses: [EVSE]?, alertMessage: String?) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longtitude = longtitude
        self.icon = icon
        self.address = address
        self.city = city
        self.openHours = openHours
        self.provider = provider
        self.pictures = pictures
        self.evses = evses
        self.alertMessage = alertMessage
    }


}
