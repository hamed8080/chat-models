//
// PinMessage.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class PinMessage: NSObject, Codable, Identifiable {
    public static func == (lhs: PinMessage, rhs: PinMessage) -> Bool {
        lhs.messageId == rhs.messageId
    }

    public var id: Int? { messageId }
    public var messageId: Int?
    public var text: String?
    public var time: UInt?
    public var timeNanos: UInt?
    public var sender: Participant?
    public var notifyAll: Bool?
    public var metadata: String?


    public init(messageId: Int? = nil,
                text: String? = nil,
                time: UInt? = nil,
                timeNanos: UInt? = nil,
                sender: Participant? = nil,
                metaData: String? = nil,
                notifyAll: Bool? = nil) {
        self.messageId = messageId
        self.text = text
        self.time = time
        self.timeNanos = timeNanos
        self.sender = sender
        self.notifyAll = notifyAll
        self.metadata = metaData
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messageId = try container.decodeIfPresent(Int.self, forKey: .messageId)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        time = try container.decodeIfPresent(UInt.self, forKey: .time)
        timeNanos = try container.decodeIfPresent(UInt.self, forKey: .timeNanos)
        sender = try container.decodeIfPresent(Participant.self, forKey: .sender)
        notifyAll = try container.decodeIfPresent(Bool.self, forKey: .notifyAll)
        metadata = try container.decodeIfPresent(String.self, forKey: .metadata)
    }

    public init(message: Message) {
        messageId = message.id
        text = message.message
        time = message.time
        timeNanos = message.timeNanos
        sender = message.participant
        notifyAll = message.pinNotifyAll
        metadata = message.metadata
    }

    private enum CodingKeys: CodingKey {
        case messageId
        case text
        case timeNanos
        case time
        case sender
        case notifyAll
        case metadata
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(messageId, forKey: .messageId)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(timeNanos, forKey: .timeNanos)
        try container.encodeIfPresent(sender, forKey: .sender)
        try container.encodeIfPresent(notifyAll, forKey: .notifyAll)
        try container.encodeIfPresent(metadata, forKey: .metadata)
    }

    var message: Message {
        Message(id: messageId, message: text, metadata: metadata, time: time, timeNanos: timeNanos, participant: sender, notifyAll: notifyAll)
    }
}
