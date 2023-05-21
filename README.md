## MovieDB Flutter Application
This is a Flutter application that fetches and displays a list of movies from the MovieDB API. The application follows the principles of clean architecture, separating concerns into different layers and using the Bloc package for state management and the GetIt package for dependency injection.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites
Flutter SDK: Make sure you have Flutter installed on your machine. If not, you can get it from here.
Dart: Dart is the language used in Flutter. You can install it from here.
An IDE: You can use Android Studio, IntelliJ, or VS Code for this project.
Installation
Clone the repository:
bash
Copy code
git clone https://github.com/yourusername/moviedb.git
Navigate to the project directory:
bash
Copy code
'''cd moviedb'''
Get the dependencies:
Copy code
'''flutter pub get'''

Run build runner
'''flutter packages pub run build_runner build --delete-conflicting-outputs'''

Copy code
'''flutter run'''
Project Structure
The project is structured following the principles of clean architecture. It is divided into the following layers:

Entity: This layer contains the Movie entity which is the core of the application.
Data Sources: This layer interacts with the API to fetch data.
Repositories: This layer serves as a bridge between the data sources and the use cases.
Use Cases: This layer contains the business logic of the application.
Presentation: This layer is responsible for displaying the data to the user.
Built With
Flutter - The UI framework used.
Bloc - State management.
GetIt - Dependency Injection.
http - Networking.
Contributing
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

License
This project is licensed under the MIT License - see the LICENSE.md file for details.

### Author 
Kopano Mariri
Linkedin
https://www.linkedin.com/in/kopano-mariri-847b39141/

