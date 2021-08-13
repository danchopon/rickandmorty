//
//  AppDelegate.swift
//  reddittest
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit
import Moya

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        let networkManager = makeNetworkManager()
        let charactersController = makeCharactersController(networkManager: networkManager)
        window?.rootViewController = charactersController
        window?.makeKeyAndVisible()
        return true
    }
    
    private func makeNetworkManager() -> NetworkManager {
        let provider = MoyaProvider<MultiTarget>(plugins: [])
        let networkManager = NetworkManager(provider: provider)
        return networkManager
    }
    
    private func makeCharactersController(networkManager: NetworkManager) -> CharacterViewController {
        let repository = CharactersRemoteRepository(networkManager: networkManager)
        let contentView = CharacterContentView()
        let model = CharacterModel(repository: repository)
        let controller = CharacterViewController(contentView: contentView, model: model)
        model.output = controller
        return controller
    }
}

