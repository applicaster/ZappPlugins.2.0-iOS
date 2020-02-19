//
//  ZPPluginPushNotificationTests.swift
//  ZappPlugins
//
//  Created by Miri on 02/12/2016.
//  Copyright © 2016 Anton Kononenko. All rights reserved.
//

import XCTest
@testable import ZappPlugins

class ZPPluginPushNotificationTests: XCTestCase {
    
    let mockPluginsFileName = "push_configurations_mock"
    var pluginData: NSDictionary?
    var pluggableProvider: ZPPushProviderProtocol?
    
    override func setUp() {
        super.setUp()
        
        if let path = NSBundle(forClass:ZPPluginPushNotificationTests.self).pathForResource(mockPluginsFileName, ofType: "json") {
            if let jsonData = NSData(contentsOfFile:path) {
                
                do {
                    if let arrayOfDictionaries = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) as? NSArray {
                        if let pushPluginData = arrayOfDictionaries.firstObject as? NSDictionary {
                            pluginData = pushPluginData
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
    
    func testCreationPushModel() {
        XCTAssertNotNil(pluginData)
        var model = ZPPluginModel(object: pluginData!)
        XCTAssertNotNil(model)
        XCTAssertTrue(model!.plugin.allKeys.count > 0)
        
        XCTAssertNotNil(model?.plugin)
        XCTAssertNotNil(model?.configurationJSON)
        
        model = ZPPluginModel(object: NSDictionary())
        XCTAssertNil(model)
        
        model = ZPPluginModel(object: nil)
        XCTAssertNil(model)
        
    }
    
    func testPluginClassName() {
        let testedModel = ZPPluginModel(object: pluginData!)
        XCTAssert(testedModel?.pluginClassName == "ZappPushPlugins.APPushProviderUrbanAirship")
    }
    
    func testPluginType() {
        let testedModel = ZPPluginModel(object: pluginData!)
        XCTAssert(testedModel?.pluginType == .Push)
    }
}
