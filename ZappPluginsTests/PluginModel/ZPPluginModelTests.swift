//
//  ZPPluginModelTests.swift
//  ZappPlugins
//
//  Created by Anton Kononenko on 21/06/16.
//  Copyright © 2016 Applicaster. All rights reserved.
//

import XCTest
@testable import ZappPlugins
@testable import ZappCore

class ZPPluginModelTests: XCTestCase {
    let mockPluginsFileName = "plugin_configurations_mock"
    var pluginData: NSDictionary?
    
    override func setUp() {
        super.setUp()
        
        if let path = Bundle(for: ZPPluginModelTests.self).path(forResource: mockPluginsFileName, ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                
                do {
                    if let arrayOfDictionaries = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? NSArray {
                        if let firstPluginData = arrayOfDictionaries.firstObject as? NSDictionary {
                            pluginData = firstPluginData
                        }
                    }
                }
                catch _ as NSError {
                    
                }
            }
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreationModel() {
        XCTAssertNotNil(pluginData)
        var model = ZPPluginModel(object: pluginData!)
        XCTAssertNotNil(model)

        XCTAssertNotNil(model?.configurationJSON)
        
        model = ZPPluginModel(object: NSDictionary())
        XCTAssertNil(model)
        
        model = ZPPluginModel(object: nil)
        XCTAssertNil(model)
     
    }
    
    func testPluginClassName() {
        let testedModel = ZPPluginModel(object: pluginData!)
        XCTAssert(testedModel?.pluginClassName == "MATabBarAdapter")
    }
    
    func testPluginType() {
        let testedModel = ZPPluginModel(object: pluginData!)
        XCTAssert(testedModel?.pluginType == .Root)
    }
}
