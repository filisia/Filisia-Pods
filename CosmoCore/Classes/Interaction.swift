public protocol InteractionBase: AnyObject {
    associatedtype Settings: InteractionSettings
    var settings: Settings { get set }
}

public protocol InteractionBaseScores: AnyObject {
    associatedtype Scores: InteractionScores
    var scores: Scores { get set }
}

public protocol Interaction: AnyObject {
    var identifier: String { get }
    var name: String { get }
    var imageName: String { get }
    var viewController: UIViewController { get }
    var metadata: InteractionMetadata { get }
    // this is modified when we load activities, based on user access
    var containedInSubscription: Bool { get set }
    var isDataActivity: Bool { get set }
    var isPremium: Bool { get set }
    var filteredOut: Bool { get set }
}

public extension InteractionBase {
    var settings: Settings {
        set {
            let store = InteractionSettingsPersistentStore(interactionName: Settings.identifier)
            try? store.store(newValue)
        }
        get {
            let store = InteractionSettingsPersistentStore(interactionName: Settings.identifier)
            do {
                return try store.settings() as Settings
            }
            catch {
                // if retrieaval of the values from the store fails, we initialise with the default initial values
                // try to store them and return.
                let settings = Settings.init()
                try? store.store(settings)
                return settings
            }
        }
    }
}

public extension InteractionBaseScores {
    var scores: Scores {
        set {
            let store = InteractionScoresPersistentStore(interactionName: Scores.identifier)
            try? store.store(newValue)
        }
        get {
            let store = InteractionScoresPersistentStore(interactionName: Scores.identifier)
            do {
                return try store.scores() as Scores
            }
            catch {
                // if retrieaval of the values from the store fails, we initialise with the default initial values
                // try to store them and return.
                let scores = Scores.init()
                try? store.store(scores)
                return scores
            }
        }
    }
}

public extension Interaction where Self: InteractionBase {
    var imageName: String {
        return settings.imageName
    }
    var name: String {
        return settings.localisedName
    }
    var metadata: InteractionMetadata {
        return settings.metadata
    }
}


public protocol InteractionMain: UIViewController {
    associatedtype Settings: InteractionSettings
    init(settings: Settings)
//    func reinit()
}


