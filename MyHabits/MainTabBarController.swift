
import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            createController(viewController: ViewController(), title: "Привычки", image: UIImage(systemName: "checklist")),
            createController(viewController: InfoView(), title: "Информация", image: UIImage(systemName: "info.circle.fill"))
        ]
        tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor.purple // then change in correct RGB purple color

    }
    
}


private extension MainTabBarController {
    func createController(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
