//
//  InteractionMetadata.swift
//  CosmoCore
//
//  Created by Alexandros Binopoulos on 1/10/20.
//

public struct InteractionMetadata: OptionSet, Codable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public var description: String {
        var vals = [String]()
        if self.contains(.musicAndVocalisation) {
            vals.append("musicAndVocalisation")
        }
        if self.contains(.runningAndMotor) {
            vals.append("runningAndMotor")
        }
        if self.contains(.turntaking) {
            vals.append("turntaking")
        }
        if self.contains(.causeAndEffect) {
            vals.append("causeAndEffect")
        }
        if self.contains(.screenBased) {
            vals.append("screenBased")
        }
        if self.contains(.cognitiveAndAttention) {
            vals.append("cognitiveAndAttention")
        }
        if self.contains(.language) {
            vals.append("language")
        }
        if self.contains(.numeracy) {
            vals.append("numeracy")
        }

        if self.contains(.early) {
            vals.append("early")
        }
        if self.contains(.intermediate) {
            vals.append("intermediate")
        }
        if self.contains(.advanced) {
            vals.append("advanced")
        }

        if self.contains(.one) {
            vals.append("one")
        }
        if self.contains(.two) {
            vals.append("two")
        }
        if self.contains(.three) {
            vals.append("three")
        }
        if self.contains(.four) {
            vals.append("four")
        }
        if self.contains(.five) {
            vals.append("five")
        }
        if self.contains(.six) {
            vals.append("six")
        }

        if self.contains(.solo) {
            vals.append("solo")
        }
        if self.contains(.group) {
            vals.append("group")
        }
        if self.contains(.rival) {
            vals.append("rival")
        }
        if self.contains(.devicesOne) {
            vals.append("oneDevice")
        }
        if self.contains(.devicesTwo) {
            vals.append("twoDevice")
        }
        if self.contains(.devicesThree) {
            vals.append("threeDevice")
        }
        if self.contains(.devicesFour) {
            vals.append("fourDevice")
        }
        if self.contains(.devicesFive) {
            vals.append("fiveDevice")
        }
        if self.contains(.devicesSix) {
            vals.append("sixDevice")
        }

        return vals.joined(separator: ",")
    }

    // skills
    public static let musicAndVocalisation = InteractionMetadata(rawValue: 1 << 0)
    public static let runningAndMotor = InteractionMetadata(rawValue: 1 << 1)
    public static let turntaking = InteractionMetadata(rawValue: 1 << 2)
    public static let causeAndEffect = InteractionMetadata(rawValue: 1 << 3)
    public static let screenBased = InteractionMetadata(rawValue: 1 << 4)
    public static let cognitiveAndAttention = InteractionMetadata(rawValue: 1 << 5)
    public static let language = InteractionMetadata(rawValue: 1 << 6)
    public static let numeracy = InteractionMetadata(rawValue: 1 << 7)

    // difficulty
    public static let early = InteractionMetadata(rawValue: 1 << 8)
    public static let intermediate = InteractionMetadata(rawValue: 1 << 9)
    public static let advanced = InteractionMetadata(rawValue: 1 << 10)

    // players
    public static let one = InteractionMetadata(rawValue: 1 << 11)
    public static let two = InteractionMetadata(rawValue: 1 << 12)
    public static let three = InteractionMetadata(rawValue: 1 << 13)
    public static let four = InteractionMetadata(rawValue: 1 << 14)
    public static let five = InteractionMetadata(rawValue: 1 << 15)
    public static let six = InteractionMetadata(rawValue: 1 << 16)

    // mode of playing
    public static let solo = InteractionMetadata(rawValue: 1 << 17)
    public static let group = InteractionMetadata(rawValue: 1 << 18)
    public static let rival = InteractionMetadata(rawValue: 1 << 19)

    // number of devices
    public static let devicesOne = InteractionMetadata(rawValue: 1 << 20)
    public static let devicesTwo = InteractionMetadata(rawValue: 1 << 21)
    public static let devicesThree = InteractionMetadata(rawValue: 1 << 22)
    public static let devicesFour = InteractionMetadata(rawValue: 1 << 23)
    public static let devicesFive = InteractionMetadata(rawValue: 1 << 24)
    public static let devicesSix = InteractionMetadata(rawValue: 1 << 25)

    // categories
    public static let categoryMusic = InteractionMetadata(rawValue: 1 << 26)
    public static let categoryPhysical = InteractionMetadata(rawValue: 1 << 27)
    public static let categoryCauseAndEffect = InteractionMetadata(rawValue: 1 << 28)
    public static let categoryCognitive = InteractionMetadata(rawValue: 1 << 29)
    public static let categoryNumeracy = InteractionMetadata(rawValue: 1 << 30)
    public static let categoryLanguage = InteractionMetadata(rawValue: 1 << 31)

    public static let allCategoryOptions: InteractionMetadata = [.categoryMusic,
                                                                 .categoryPhysical,
                                                                 .categoryCauseAndEffect,
                                                                 .categoryCognitive,
                                                                 .categoryNumeracy,
                                                                 .categoryLanguage]

    public static let allSkillOptions: InteractionMetadata = [.musicAndVocalisation,
                                                              .runningAndMotor,
                                                              .turntaking,
                                                              .causeAndEffect,
                                                              .screenBased,
                                                              .cognitiveAndAttention,
                                                              .language,
                                                              .numeracy]

    public static let allDifficultyOptions: InteractionMetadata = [.early,
                                                                  .intermediate,
                                                                  .advanced]

    public static let allPlayerOptions: InteractionMetadata = [.one,
                                                               .two,
                                                               .three,
                                                               .four,
                                                               .five,
                                                               .six]

    public static let allPlayingModesOptions: InteractionMetadata = [.solo,
                                                                     .group,
                                                                     .rival]

    public static let allMetadataOptions: InteractionMetadata = [.allSkillOptions,
                                                                 .allDifficultyOptions,
                                                                 .allPlayerOptions,
                                                                 .allPlayingModesOptions,
                                                                 .allDevicesOptions]

    public static let allDevicesOptions: InteractionMetadata = [.devicesOne,
                                                               .devicesTwo,
                                                               .devicesThree,
                                                               .devicesFour,
                                                               .devicesFive,
                                                               .devicesSix]

}

public extension OptionSet where RawValue: FixedWidthInteger {

    func elements() -> AnySequence<Self> {
        var remainingBits = rawValue
        var bitMask: RawValue = 1
        return AnySequence {
            return AnyIterator {
                while remainingBits != 0 {
                    defer { bitMask = bitMask &* 2 }
                    if remainingBits & bitMask != 0 {
                        remainingBits = remainingBits & ~bitMask
                        return Self(rawValue: bitMask)
                    }
                }
                return nil
            }
        }
    }
}

extension InteractionMetadata {
    public func hasSomethingInCommon(with category: InteractionMetadata, compare option: InteractionMetadata) -> Bool {
        // first see if the set contains any elements from the category set
        guard !self.isDisjoint(with: category) else {
            // if the option set does not specify this catetory, it contains it
            return true
        }
        var newSet = category
        newSet.formIntersection(option)
        return !newSet.isDisjoint(with: self)
    }

    public func containsElementsInCommonButNotAll(with option: InteractionMetadata) -> Bool {
        var comparedOptionSet = self
        comparedOptionSet.formIntersection(option)
        return !self.isDisjoint(with: option) && option.contains(comparedOptionSet)
    }
}
