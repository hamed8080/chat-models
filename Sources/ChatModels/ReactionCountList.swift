
// ReactionCountList.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class ReactionCountList: Codable, Hashable, Identifiable {
    public static func == (lhs: ReactionCountList, rhs: ReactionCountList) -> Bool {
        lhs.messageId == rhs.messageId
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }

    public var messageId: Int?
    public var reactionCounts: [ReactionCount]?

    public required init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { return }
        messageId = try container.decodeIfPresent(Int.self, forKey: .messageId)
        reactionCounts = try container.decodeIfPresent([ReactionCount].self, forKey: .reactionCountVO)
    }

    public init(messageId: Int? = nil, reactionCounts: [ReactionCount]? = nil) {
        self.messageId = messageId
        self.reactionCounts = reactionCounts
    }

    private enum CodingKeys: String, CodingKey {
        case messageId
        case reactionCountVO
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(messageId, forKey: .messageId)
        try container.encodeIfPresent(reactionCounts, forKey: .reactionCountVO)
    }
}
