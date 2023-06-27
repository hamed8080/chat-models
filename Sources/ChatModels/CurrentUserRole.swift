//
// CurrentUserRole.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class CurrentUserRole: Codable, Hashable, Identifiable {
    public static func == (lhs: CurrentUserRole, rhs: CurrentUserRole) -> Bool {
        lhs.threadId == rhs.threadId
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(roles)
    }

    public var threadId: Int?
    public var roles: [Roles]?

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        roles = try container.decode([Roles].self, forKey: .roles)
    }

    public init(threadId: Int? = nil, roles: [Roles]? = nil) {
        self.roles = roles
        self.threadId = threadId
    }

    private enum CodingKeys: String, CodingKey {
        case roles
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(roles, forKey: .roles)
    }
}
