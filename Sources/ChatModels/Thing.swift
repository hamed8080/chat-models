//
// Thing.swift
// Copyright (c) 2022 ChatModels
//
// Created by Hamed Hosseini on 12/14/22

import Foundation
import ChatModels

public struct Thing: Codable {
    public var id: Int? // its thing id of relevant thing of this bot in SSO
    public var name: String? // bot name
    public var title: String? // bot name
    public var type: String? // it must be Bot
    public var bot: Bool?
    public var active: Bool?
    public var chatSendEnable: Bool?
    public var chatReceiveEnable: Bool?
    public var owner: Participant?
    public var creator: Participant?
}
