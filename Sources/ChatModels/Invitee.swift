//
// Invitee.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

@objc(Invitee)
open class Invitee: NSObject, Codable {
    public var id: String?
    public var idType: Int?

    public init(id: String?, idType: InviteeTypes?) {
        self.id = id
        self.idType = idType?.rawValue
    }

    public var inviteeTypes: InviteeTypes {
        InviteeTypes(rawValue: idType ?? InviteeTypes.unknown.rawValue) ?? .unknown
    }
}
