//
//  ScreenModelHooksMock.swift
//  ZappPluginsTests
//
//  Created by Anton Kononenko on 12/27/18.
//  Copyright © 2018 Applicaster LTD. All rights reserved.
//

import Foundation

var screenModelWith1Hook = ["hooks":
    [
        "preload_plugins" : [
            [
                "screen_id": "1",
                "identifier": "hook_screen",
                "type": "general",
                "weight": 1
            ]
        ]
    ]
]

var screenModelWith2Hook = ["hooks":
    [
        "preload_plugins" : [
            [
                "screen_id": "1",
                "identifier": "hook_screen",
                "type": "general",
                "weight": 1
            ],
            [
                "identifier": "hook",
                "type": "general",
                "weight": 2
            ]
        ]
    ]
]

var screenModelWrongData1 = ["hooks":
    [
        "preload_plugins" : [
            [
                "screen_id": 123,
                "identifier": "hook",
                "type": "general",
                "weight": 1
            ]
        ]
    ]
]

var screenModelWrongData2 = ["hooks":
    [
        "preload_plugins" : [
            [
                "screen_id": 123,
                "identifier": 1,
                "type": 321,
                "weight": 1
            ]
        ]
    ]
]


var screenModelWithNoHooks = ["hooks": [:]]
var screenModelWithHooksNil:[String:Any] = [:]
