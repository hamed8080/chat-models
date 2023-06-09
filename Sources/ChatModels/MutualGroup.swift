//
// MutualGroup.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class MutualGroup: Codable, Identifiable, Hashable {
    public static func == (lhs: MutualGroup, rhs: MutualGroup) -> Bool {
        lhs.mutualId == rhs.mutualId
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(mutualId)
    }

    public var mutualId: String?
    public var idType: InviteeTypes?
    public var conversations: [Conversation]?

    private enum CodingKeys: String, CodingKey {
        case mutualId
        case conversations
    }

    public required init(from _: Decoder) throws {}

    public init(idType: InviteeTypes, mutualId: String?, conversations: [Conversation]? = nil) {
        self.mutualId = mutualId
        self.idType = idType
        self.conversations = conversations
    }

    public func encode(to _: Encoder) throws {}
}
