//
// ReplyPrivatelyInfo.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class ReplyPrivatelyInfo: NSObject, Codable, Identifiable {
    public static func == (lhs: ReplyPrivatelyInfo, rhs: ReplyPrivatelyInfo) -> Bool {
        lhs.threadId == rhs.threadId && lhs.threadName == rhs.threadName
    }

    public var threadId: Int?
    public var threadName: String?

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        threadId = try container.decodeIfPresent(Int.self, forKey: .threadId)
        threadName = try container.decodeIfPresent(String.self, forKey: .threadName)
    }

    public init(threadId: Int? = nil, threadName: String? = nil) {
        self.threadId = threadId
        self.threadName = threadName
    }

    private enum CodingKeys: String, CodingKey {
        case threadId
        case threadName
    }
}
