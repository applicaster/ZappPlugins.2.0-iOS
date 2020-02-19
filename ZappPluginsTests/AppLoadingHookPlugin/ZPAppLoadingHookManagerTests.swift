//
//  ZPAppLoadingHookTests.swift
//  ZappPlugins
//
//  Created by Miri on 11/06/2017.
//  Copyright © 2017 Anton Kononenko. All rights reserved.
//

import XCTest
@testable import ZappPlugins
@testable import ZappCore

class ZPAppLoadingHookTests: XCTestCase {
    let mockHookPluginsFileName = "plugin_configurations_mock_hook_plugins"
    var pluginsModel:[ZPPluginModel]?

    override func setUp() {
        super.setUp()
        
        if let path = Bundle(for:ZPAppLoadingHookTests.self).path(forResource: mockHookPluginsFileName, ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                
                do {
                    if let arrayOfDictionaries = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? NSArray {
                        for model in arrayOfDictionaries {
                            if let pluginRawModel = model as? NSDictionary {
                                if pluginsModel == nil {
                                    pluginsModel = [ZPPluginModel]()
                                }
                                
                                if let model = ZPPluginModel(object: pluginRawModel) {
                                    pluginsModel?.append(model)
                                }
                            }
                        }
                    }
                }
                catch _ as NSError {
                    
                }
            }
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHookPlugins() {
        let pluginModels = pluginsModel?.filter { $0.pluginRequireStartupExecution == true }
        XCTAssert(pluginModels?.count == 2)
    }

    func testExecuteOnLaunch() {
        XCTAssertNotNil(ZPAppLoadingHookManager.sharedInstance.executeOnLaunch(completion:))
    }

    func testExecuteOnApplicationReady() {
        let displayViewController: UIViewController? = UIViewController()
        XCTAssertNotNil(ZPAppLoadingHookManager.sharedInstance.executeOnApplicationReady(displayViewController: displayViewController, completion: { 
        }))

    }
    
    func testExecuteAfterAppRootPresentation() {
        let displayViewController: UIViewController? = UIViewController()
        XCTAssertNotNil(ZPAppLoadingHookManager.sharedInstance.executeAfterAppRootPresentation(displayViewController: displayViewController, completion: {
            //
        }))
    }
}
