//
// ForwardInfo.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class ForwardInfo: NSObject, Codable {
    public var conversation: Conversation?
    public var participant: Participant?

    private enum CodingKeys: String, CodingKey {
        case conversation
        case participant
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        conversation = try container.decodeIfPresent(Conversation.self, forKey: .conversation)
        participant = try container.decodeIfPresent(Participant.self, forKey: .participant)
    }

    public init(conversation: Conversation?, participant: Participant?) {
        self.conversation = conversation
        self.participant = participant
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(participant, forKey: .participant)
        try container.encodeIfPresent(conversation, forKey: .conversation)
    }
}
