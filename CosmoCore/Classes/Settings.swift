//
//  Settings.swift
//  CosmoCore
//
//  Created by Alkiviadis Papadakis on 24/03/2020.
//

import Foundation

public protocol InteractionSettings: Codable {
    static var identifier: String { get }
    var localisedName: String { get }
    var localisedDescription: String { get }
    var imageName: String { get }
    var metadata: InteractionMetadata { get }

    init()
}

public protocol SettingsPersistentStore {
    init(interactionName: String, userDefaults: UserDefaults)
    func settings<SettingsType: Decodable>() throws -> SettingsType
    func store<SettingsType: Encodable>(_ settings: SettingsType) throws
}

public class InteractionSettingsPersistentStore: SettingsPersistentStore {
    public enum PersistentStoreError: Error {
        case unableToDecodeData
    }
    private let interactionName: String
    private let userDefaults: UserDefaults

    required public init(interactionName: String, userDefaults: UserDefaults = UserDefaults.standard) {
        self.interactionName = interactionName
        self.userDefaults = userDefaults
    }

    public func store<SettingsType: Encodable>(_ settings: SettingsType) throws {
        let data = try JSONEncoder().encode(settings)
        userDefaults.set(data, forKey: interactionName)
    }

    public func settings<SettingsType: Decodable>() throws -> SettingsType {
        guard let data = userDefaults.data(forKey: interactionName) else {
            throw PersistentStoreError.unableToDecodeData
        }
        return try JSONDecoder().decode(SettingsType.self, from: data)
    }
}
