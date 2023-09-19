
// ReactionCountList.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class ReactionCount: Codable, Hashable, Identifiable {
    public static func == (lhs: ReactionCount, rhs: ReactionCount) -> Bool {
        lhs.sticker == rhs.sticker
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(sticker)
        hasher.combine(count)
    }

    public var sticker: Int?
    public var count: Int?
    public var id: Int { hashValue }

    public required init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { return }
        sticker = try container.decodeIfPresent(Int.self, forKey: .sticker)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
    }

    public init(sticker: Int? = nil, count: Int? = nil) {
        self.sticker = sticker
        self.count = count
    }

    private enum CodingKeys: String, CodingKey {
        case sticker
        case count
    }
}
