# crypto
Integration of crypto API to show a list of cryptos

## ===== Dev Instructions =====

1. Clone the repo
2. In the command line run
     ```
     flutter pub get.
     ```
3. Open an emulator. Youcan use either flutter's, android studio's or your own cellphone connected to the pc
4. In the command line run, 
    ```
    flutter run
    ```
5. If you want a faster run of the application you may run it in the web browser by executing the next command line,
    ```
    flutter run -d chrome
    ```
5. The application will build and install in your emulator, web browser or device. Remember if you have more than one connected the user interface will ask you to choose one.
6. Enjoy it!

## ===== Inside the app, main functionalities =====

Once you run the app, it will take you to the search NFTs page. You will be able to enter an address and once you click on the search button if there are NFTs to show will automatically take you to the listing page. Keep in mind you will not be able to enter an invalid address, meaning it ca not be empty, null or an address with appropiate length.

On the listing page you will be able to check all the NFTs and if you click on one of them it will take you to the details page of it. There is a small back arrow at the top which if pressed will take to the home page with a transition animation.

Once on the details page it will display more information of the NFT being this information name,creation date, chain, image and a description.

## ===== Good practices =====
Here I'm listing all the good practices used in this project in order to facilitate an example for developers on how to implement certain functionalities in a Flutter application. If they helped you with your own project do not forget to upvote(star) the repo, will mean a lot to me!  

1. BLOC pattern
2. Flutter_modular to manage routing. This also gives you the ability to apply beautiful transitions.
3. Testing.
4. DI using get_it package
5. API integration
6. Constants usage to avoid magic strings
7. Clean aruitecture by Uncle Bob(feature based)
