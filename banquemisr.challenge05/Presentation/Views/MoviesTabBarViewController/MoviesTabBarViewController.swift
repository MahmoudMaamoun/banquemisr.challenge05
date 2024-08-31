//
//  MoviesTabBarViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import UIKit

class MoviesTabBarViewController: UITabBarController {
    private let apiClient = APIClient()
    private lazy var moviesRepo = MoviesDataRepositoriy(apiClient: apiClient)
    private lazy var fetchMoviesUseCase = FetchMoviesUseCase(movieRepository: moviesRepo)
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers()
        // Do any additional setup after loading the view.
    }
    
    private func setUpViewControllers() {
        let nowPlayingViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .nowPlaying)
        let popularViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .popular)
        let upCommingViewModel = MoviesViewModel(fetchMoviesUseCase: fetchMoviesUseCase, category: .upComming)
        
        let nowPlayingViewController = MoviesListViewController(viewModel: nowPlayingViewModel)
        nowPlayingViewController.title = "now playing"
        
        let popularViewController = MoviesListViewController(viewModel: popularViewModel)
        popularViewController.title = "popular"
        
        let upCommingViewController = MoviesListViewController(viewModel: upCommingViewModel)
        upCommingViewController.title = "upcoming"
        
        self.viewControllers = [UINavigationController(rootViewController: nowPlayingViewController),UINavigationController(rootViewController: popularViewController),UINavigationController(rootViewController: upCommingViewController)]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
