//
// PinMessage.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class PinMessage: Codable, Identifiable, Hashable {
    public static func == (lhs: PinMessage, rhs: PinMessage) -> Bool {
        lhs.messageId == rhs.messageId
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(messageId)
    }

    public var id: Int? { messageId }
    public var messageId: Int?
    public var text: String?
    public var time: UInt?
    public var sender: Participant?
    public var threadId: Int?

    public init(messageId: Int? = nil, text: String? = nil, time: UInt? = nil, sender: Participant? = nil) {
        self.messageId = messageId
        self.text = text
        self.time = time
        self.sender = sender
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messageId = try container.decodeIfPresent(Int.self, forKey: .messageId)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        time = try container.decodeIfPresent(UInt.self, forKey: .time)
        sender = try container.decodeIfPresent(Participant.self, forKey: .sender)
    }

    enum CodingKeys: CodingKey {
        case messageId
        case text
        case time
        case sender
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(messageId, forKey: .messageId)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(sender, forKey: .sender)
    }

    var message: Message {
        Message(threadId: threadId, id: messageId, message: text, time: time, participant: sender)
    }
}
