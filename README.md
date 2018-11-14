
# News App Assignment
an app to list all the news feeds in a list. The selection of any new feed would load
the detail page of news.

# Author
Please feel free to contanct me for any question.  

[Amjad Tubasi](https://www.linkedin.com/in/amjad-tubasi-848bbb76).  

eng.amjad.tubasi.at@gmail.com . 

Mobile : +962786760621.  

# News API Source
News API to list of all the news with on demand updates.
API parameters :

| parameter | Description |
| ------    | ------      |
| q         | user search query |
| apiKey    | key provided by https://newsapi.org/ |

### Used Design patterns
This project demonstrate [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) and [Swinject](https://github.com/Swinject/Swinject) in [MVVM (Model-View-ViewModel)](https://en.wikipedia.org/wiki/Model_View_ViewModel) architecture with [RxSwift](https://github.com/ReactiveX/RxSwift).


### App Description

Articles list which fetched from public news API. The user has to search about any company using the top search bar to fetch articles.

Once the user tap on any article, the app shows the article details such as title, decription, image, url..etc.

### App Groups

- **Configurations**: App has three xcconfig files to determine the App environment. the environments are Debug, Staging, and Production. You can select one of them for run, test or archive. each environment has it server base URL, API key and app name.

- **MVVM** : Model View ViewModel
  * Model : 
     * Entities: is a simple data model which implement decodable parsing protocol to decode JSON from API Call.
     * Networking: protocol method to fetch JSON from HTTP request and decode it using 'Himotoki' Pod.
     It uses Alamofire Pod for Networking. 
  * View: It is a simple group which contains all app cells and view controllers.
  *  View Model: It is a group which contains app view models.
     * ex : `ArticlesSearchViewModel` is a view model for `SearchViewControlle`r.It uses RxSwift to define Inputs and Outputs by `AtriclesSearchViewModeling` protocol.It implement `AtriclesSearchViewModeling` protocol to handle user seach query and fetch it using `Network` Model and present it as CellModel which called `ArticleCellModeling`.Also It handle user row selection by `presentDetails` Observable which emit a row selection event to `SearchViewController`. 
- **Managers** : 
  * DependencyInjection : class used for register Models , ViewModels and Views into shared container.
 It can be used to reslove the injected dependencies into another instnace.
  * ImageLoader: Use `Nuke` Pod to make simple tasks like loading images into views extremely simple.
  
- **Preferences**: used to get all app preferences like base URL, apiKey ..etc. and it used to for main bundle methods (fetch values from `info.plist` file).
- **Resources**: group contains Localizable String files to show the app in English and Arabic languages. 
   

### Testing
Apply UI and Unit testing for search feature.
