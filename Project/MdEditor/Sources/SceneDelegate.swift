//
//  SceneDelegate.swift
//  MdEditor
//
//  Created by ioskendev on 25.12.2023.
//

import UIKit
import TaskManagerPackage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	private var appCoordinator: ICoordinator! // swiftlint:disable:this implicitly_unwrapped_optional

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		let repository = TaskRepositoryStub()
		let orderedTaskManager = OrderedTaskManager(taskManager: TaskManager())
		orderedTaskManager.addTasks(tasks: repository.getTasks())
		
		appCoordinator = AppCoordinator(window: window, taskManager: orderedTaskManager)
		appCoordinator.start()

		self.window = window
	}
}
