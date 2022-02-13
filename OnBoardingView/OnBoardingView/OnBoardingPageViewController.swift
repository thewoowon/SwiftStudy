//
//  OnBoardingPageViewController.swift
//  OnBoardingView
//
//  Created by woowon on 2022/01/31.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    var bottomButtonMargin : NSLayoutConstraint?
    var pageControl = UIPageControl()
    var startIndex = 0
    var currentIndex = 0
    {
        didSet{
            pageControl.currentPage = currentIndex
        }
    }

    func makePageView()
    {
        let view1 =  OnBoardingViewController.init(nibName: "OnBoardingViewController", bundle: nil)
        view1.mainText = "Page 1"
        view1.descriptionText = "첫 페이지입니다."
        view1.topimage = UIImage(named: "casper1")
        let view2 =  OnBoardingViewController.init(nibName: "OnBoardingViewController", bundle: nil)
        view2.mainText = "Page 2"
        view2.descriptionText = "두번째 페이지입니다."
        view2.topimage = UIImage(named: "casper2")
        
        let view3 =  OnBoardingViewController.init(nibName: "OnBoardingViewController", bundle: nil)
        view3.mainText = "Page 3"
        view3.descriptionText = "세번째 페이지입니다."
        view3.topimage = UIImage(named: "casper3")
        
        pages.append(view1)
        pages.append(view2)
        pages.append(view3)
        
        
        
        setViewControllers([view1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageView()
        self.makePageControl()
        self.makeButton()
    }
    
    func makeButton(){
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .systemGreen
        
        button.addTarget(self, action: #selector(dismissPageView), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: 0)
        
        bottomButtonMargin?.isActive = true
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button .rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.hideButton()
    }
    
    @objc func dismissPageView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func makePageControl(){
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -80).isActive = true
        
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //pageControl.isUserInteractionEnabled = false
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    
    }
    @objc func pageControlTapped(sender:UIPageControl){
        
        if sender.currentPage > currentIndex{
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)

        }
        else{
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        currentIndex  = sender.currentPage
        
        buttonPresentationStyle()
    }
}


extension OnBoardingPageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else{
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0{
            return pages.last
        }
        else
        {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else{
            return nil
        }
        self.currentIndex = currentIndex
        if  currentIndex == pages.count - 1{
            return pages.first
        }else{
            return pages[currentIndex + 1]
        }
    }
}


extension OnBoardingPageViewController : UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVc = pageViewController.viewControllers?.first else{
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVc) else{
            return
        }
        
        self.currentIndex = currentIndex
        
        buttonPresentationStyle()
    }
    
    func buttonPresentationStyle(){
        if currentIndex == pages.count - 1{
            // show button
            self.showButton()
        }
        else{
            // hide button
            self.hideButton()
        }
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    
    func showButton(){
        bottomButtonMargin?.constant = 0
    }
    func hideButton(){
        bottomButtonMargin?.constant = 100
    }
}
