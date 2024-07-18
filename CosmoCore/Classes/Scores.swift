//
//  Scores.swift
//  CosmoCore
//
//  Created by Alexandros Binopoulos on 10/7/22.
//

import Foundation

public protocol InteractionScores: Codable {
    static var identifier: String { get }
    var levelTopScore: [Int: Int] { get }

    init()
}

// MARK: - ScoresPersistentStore
public protocol ScoresPersistentStore {
    init(interactionName: String, userDefaults: UserDefaults)
    func scores<ScoresType: Decodable>() throws -> ScoresType
    func store<ScoresType: Encodable>(_ scores: ScoresType) throws
}

public class InteractionScoresPersistentStore: ScoresPersistentStore {
    public enum PersistentStoreError: Error {
        case unableToDecodeData
    }
    private let interactionName: String
    private let userDefaults: UserDefaults

    required public init(interactionName: String, userDefaults: UserDefaults = UserDefaults.standard) {
        self.interactionName = interactionName
        self.userDefaults = userDefaults
    }

    public func store<ScoresType: Encodable>(_ settings: ScoresType) throws {
        let data = try JSONEncoder().encode(settings)
        userDefaults.set(data, forKey: "high.scores.\(interactionName)")
    }

    public func scores<ScoresType: Decodable>() throws -> ScoresType {
        guard let data = userDefaults.data(forKey: "high.scores.\(interactionName)") else {
            throw PersistentStoreError.unableToDecodeData
        }
        return try JSONDecoder().decode(ScoresType.self, from: data)
    }
}
