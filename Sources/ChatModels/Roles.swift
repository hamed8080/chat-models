//
// Roles.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public enum Roles: String, Codable, Identifiable, CaseIterable {
    public var id: Self { self }
    case changeThreadInfo = "CHANGE_THREAD_INFO"
    case postChannelMessage = "POST_CHANNEL_MESSAGE"
    case editMessageOfOthers = "EDIT_MESSAGE_OF_OTHERS"
    case deleteMessageOfOthers = "DELETE_MESSAGE_OF_OTHERS"
    case addNewUser = "ADD_NEW_USER"
    case removeUser = "REMOVE_USER"
    case addRuleToUser = "ADD_RULE_TO_USER"
    case removeRoleFromUser = "REMOVE_ROLE_FROM_USER"
    case readThread = "READ_THREAD"
    case editThread = "EDIT_THREAD"
    case threadAdmin = "THREAD_ADMIN"
    case ownership = "OWNERSHIP"

    /// Only when can't decode a type.
    ///
    /// Do not remove or move this property to the top of the enum, it must be the last enum because it uses ``SafeDecodable`` to decode the last item if no match found.
    case unknown

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.last!
    }
}

public enum RoleOperations: String {
    case add
    case remove
}
