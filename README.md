# AlTayyar
Al Tayyar Case Study

The Source Code Makes Use of MVVM as the architecture Design Patterns.
We have 3 View Controller classes
1- ATSplashViewController  which is used along with Configuration ViewModel to download all the initial data along with API configurations in the background.

2- ATMoviesListViewController is the view controller which is responsible to show movies in various section of the table view. Each TableViewCell has to work along with its own ATMovieListViewModel to populate movies of specific category.

3-ATMoviesDetailViewController is the detail view controller of the Movie and it is dependent on ATMovieDetailViewModel


We have following ViewModel Classes
ATConfigurationViewModel : used to download api configurations along with first page of each category

ATMovieCategoryViewModel : contains hard coded data for various categories(Sort Types) of movies.

ATMovieListViewModel : is used by ATMoviesTableViewCell and is responsible to provide data for the cell to populate its movies list

ATMovieDetailViewModel : is used by ATMoviesDetailViewController to provide data for movie detail view


The Source Code makes use of StoryBoard and Autolayout and the main component is the UISplitViewController which works as master->Detail Viewcontroller. This makes sure that in iPad both views are shown simultaneously.


The Source Code makes use of Cocoa Pods for Dependency mangement and we have used 
AlamofireImage + Alamofire library for downloading and caching images along with making calls to different APIS.

The Source code also contains various Unit tests covering various parts of the code. I have Unit tests for UIViewControllers, UITableViewCell and ViewModels to achieve code coverage.


