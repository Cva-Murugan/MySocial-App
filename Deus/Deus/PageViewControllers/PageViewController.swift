//
//  PageViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit

class PageViewController: UIPageViewController {

    var pageControl = UIPageControl()
    
    lazy var viewControllersList: [UIViewController] = {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstVC = StoryBoard.instantiateViewController(identifier: "firstVC") as! FirstViewController
        let secondVC = StoryBoard.instantiateViewController(identifier: "secondVC") as! SecondViewController
        let ThirdVC = StoryBoard.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
        let fourthVC = StoryBoard.instantiateViewController(withIdentifier: "fourthVC") as! FourthViewController
        return [firstVC,secondVC,ThirdVC, fourthVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.configurePageControl()
        
        self.dataSource = self
        
        if let vc = viewControllersList.first{
            self.setViewControllers([vc], direction: .forward, animated: true)
        }
    }
}


extension PageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewControllersList.lastIndex(of: viewController) else { return nil }
         let previousIndex = index - 1
         guard previousIndex >= 0 else {return nil}
         guard previousIndex < viewControllersList.count else {return nil}
         return viewControllersList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllersList.lastIndex(of: viewController) else { return nil }
         let forwardIndex = index + 1
         guard forwardIndex >= 0 else {return nil}
         guard forwardIndex < viewControllersList.count else {return nil}
         return viewControllersList[forwardIndex]
    }
}

extension PageViewController:UIPageViewControllerDelegate{

    func configurePageControl() {
            pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 70, width: UIScreen.main.bounds.width, height: 50))
            pageControl.numberOfPages = viewControllersList.count
            pageControl.currentPage = 0
            pageControl.tintColor = UIColor.black
            pageControl.pageIndicatorTintColor = UIColor.white
            pageControl.currentPageIndicatorTintColor = UIColor.black
            self.view.addSubview(pageControl)
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
               if let viewControllerIndex = self.viewControllersList.firstIndex(of: viewControllers[0]) {
                   self.pageControl.currentPage = viewControllerIndex
               }
           }
       }
    
    
}
