# Github Search Made Easy

*The Why
Github is one of the world's leading software software development platform used by individuals/teams to work through problems,share ideas and move ahead. Being a popular platform among the developer world, it supports various different programming languages and projects and is considered one of the biggest repositiories of code.  Naturally, such a huge code base requires a comprehensive and advanced searching feature to find projects, projects and more to support and promote the Github open source community. And Github provides this with it's advanced searcH.
However, what about those who are realtively new to coding or to the the concept of open-source? 
As mentioned in the talks given by the the mentors and keynote speakers, it is usually the first step which scares a new open source developer. No proper knowledge about Github or is it's usage or not knowing where to start is the biggest hurdle in their path. For them, the basic search on the nav-bar is not enough to find them the projects which they can work on and the advanced search is just too complex. (I must confess, even we did not ever use the advanced search to its full potenital for searching for issues,projects or code inpite of being developers for years!)
With this project, we aim at bridging this gap. We are concerned with those class of people who are looking for a start in the open source world.

*The What
With Github search, we provide just the right amount information and input options that a newbie would need. With the help of R shiny, we build a web-app around the Github API with restricting the some of the search parameters in impliciltly in our web app's back end.
After researching on the different types of search parameters which would help retrieve the best results for a new open-source dev, we were able to conclude that parameters such
as specific labels and the popularity of the repo and the timestamps associated with the issues could be crucial in helping a newbie.
For example, Github suggests using labels such as 'good for first issue' and 'help-wanted' for calling new devs for help. Along with this, we also found other labels which were pretty popular among the community such as 'beginner' and 'open for grabs' used for referring the same set of people.
Using these findings, we use the API to find the optimum results sorted in the order of relevance that we believe would help the newbie the most.


 ## Features  
We have implemented a few features on the web app which can be used by the developer.
Currently, we have 2 fields in our search form 1.) Search query and 2.) Language
We implicitly fill values for some of the other paramteres such as state, labels and sorting criteria.
The form returns a result of the different issues which match the criteria the ser has entered in a tabular format which provides the issue name, the url as well as the description.
One of the salient features of the project is that the success of GithubSearch Made Easy is directly reliant on the the current Github community. We believe that they are the ones who are the best decision makers on classifying an issue with the right labels and providing adequate information so that we in turn can present it in the best possible way to the end user.

*Note : We also are currently considering the option of adding another field which could help the user choose what restrictions on the repository aligns with his/her interest. However, we do not plan on providing a search input where the user can enter the type of liscence to filter the project. Instead ,we intend on asking questions using less technical jargon such as 'Can this repo be re-used?','Are there any liabilities of warranty on the repo?','Are there trademark restrictions?' and so on.


## USAGE
 Designing the UI keeping in mind of the end user, the UI is very simple and intuitive and can be used by both beginners as well as experts to carry out simple searches. The user has to just enter keywords with spaces for multiple keywords in the same fashion as the search bar works in Github. Along with that, the user can provide the language for which he/she wants to search the Github code repository. The user can then just click on the link of the issue which is most relavant to his/her interests and start working!
  
## BUILD/INSTALLATION INSTRUCTIONS
  * [PLATFORM 1]
    * [BUILD EXAMPLE]
  * [PLATFORM 2]
    * [BUILD EXAMPLE]

## [INTERFACES] _(if applicable)_ 

## OTHER SOURCES OF DOCUMENTATION

## Contributor Guide
[LINK TO CONTRIBUTING.md]

## License 
