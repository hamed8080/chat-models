//
// UserRole.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

open class UserRole: Codable, Hashable, Identifiable {
    public static func == (lhs: UserRole, rhs: UserRole) -> Bool {
        lhs.userId == rhs.userId
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(roles)
        hasher.combine(userId)
    }

    public var userId: Int?
    public var name: String?
    public var roles: [Roles]?
    public var image: String?

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        roles = try container.decode([Roles].self, forKey: .roles)
        userId = try container.decode(Int.self, forKey: .id)
        image = try container.decode(String.self, forKey: .image)
    }

    public init(
        userId: Int? = nil,
        name: String? = nil,
        roles: [Roles]? = nil,
        image: String? = nil
    ) {
        self.userId = userId
        self.name = name
        self.roles = roles
        self.image = image
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case roles
        case image // for decode
        case id // for encode
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(name, forKey: .name)
        try? container.encodeIfPresent(userId, forKey: .id)
        try? container.encodeIfPresent(roles, forKey: .roles)
        try? container.encodeIfPresent(image, forKey: .image)
    }
}
