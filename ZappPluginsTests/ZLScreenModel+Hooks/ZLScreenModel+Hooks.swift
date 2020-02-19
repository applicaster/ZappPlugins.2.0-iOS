//
//  ZLScreenModel+Hooks.swift
//  ZappPluginsTests
//
//  Created by Anton Kononenko on 12/27/18.
//  Copyright © 2018 Applicaster LTD. All rights reserved.
//

import Foundation

import XCTest
@testable import ZappPlugins
@testable import ZappCore

class ZLScreenModelHoolksTests: XCTestCase {
    func testsParsing() {
        var screenModel = ZLScreenModel(object: screenModelWithHooksNil)
        XCTAssertEqual(screenModel.hooksPlugins.count, 0)
        
        screenModel = ZLScreenModel(object: screenModelWithNoHooks)
        XCTAssertEqual(screenModel.hooksPlugins.count, 0)
    
        screenModel = ZLScreenModel(object: screenModelWith1Hook)
        XCTAssertEqual(screenModel.hooksPlugins.count, 1)
        XCTAssertEqual(screenModel.preLaunchPlugins.count, 1)
        XCTAssertEqual(screenModel.postLaunchPlugins.count, 0)
        
        
        screenModel = ZLScreenModel(object: screenModelWith2Hook)
        XCTAssertEqual(screenModel.hooksPlugins.count, 1)
        XCTAssertEqual(screenModel.preLaunchPlugins.count, 2)
        XCTAssertEqual(screenModel.postLaunchPlugins.count, 0)
    }
    
    func testModels() {
        var screenModel = ZLScreenModel(object: screenModelWith2Hook)
        XCTAssertEqual(screenModel.preLaunchPlugins.count, 2)

        let dict1 = screenModel.preLaunchPlugins.first!
        let data1 = screenModel.pluginData(dict: dict1)
        XCTAssertEqual(data1?.screenId, "1")
        XCTAssertEqual(data1?.identifier, "hook_screen")
        XCTAssertEqual(data1?.type, "general")
        
        let dict2 = screenModel.preLaunchPlugins.last!
        let data2 = screenModel.pluginData(dict: dict2)
        XCTAssertNil(data2?.screenId)
        XCTAssertEqual(data2?.identifier, "hook")
        XCTAssertEqual(data2?.type, "general")
        
        screenModel = ZLScreenModel(object: screenModelWrongData1)
        let dict3 = screenModel.preLaunchPlugins.first!
        let data3 = screenModel.pluginData(dict: dict3)
        XCTAssertNil(data3?.screenId)
        XCTAssertEqual(data3?.identifier, "hook")
        XCTAssertEqual(data3?.type, "general")
        
        screenModel = ZLScreenModel(object: screenModelWrongData2)
        let dict4 = screenModel.preLaunchPlugins.first!
        let data4 = screenModel.pluginData(dict: dict4)
        XCTAssertNil(data4)
    }
}
