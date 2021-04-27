# flutter_crypt_hagg

#This

run these command below

flutter clean

flutter pub get

flutter pub run build_runner --delete-conflicting-outputs

connect to your physical device or emulator and run
flutter run

#Flutter project with Graphql implementations and mobx for state management.

#It is segmented into 5 folders
  - model (  data classes)
  - server ( graphql connections and network request)
  - utils
  - view ( for the mobile visual representation, each folder has an extension file with suffix _store.dart where all business logic are implemented,  )
  -widget where all UI components are kept for reusability


The graphql are loosely couple and can be injected anywhere.

test folder for unit testing





