# flutter_google_map

## Screen
<img src="https://github.com/lucky93agarwal/flutter_google_map/assets/53622073/06dea885-ed50-4836-a294-0b6a0a6cbc2d" width="200"  title="Hybrid Map"/>
<img src="https://github.com/lucky93agarwal/flutter_google_map/assets/53622073/f761a76a-8514-4652-a964-5220f2847f66" width="200" title="Normal Map"/>
<img src="https://github.com/lucky93agarwal/flutter_google_map/assets/53622073/594e3dc7-d4bf-4037-9550-b231fa94eecf" width="200" title="Circles"/>
<img src="https://github.com/lucky93agarwal/flutter_google_map/assets/53622073/8380a125-727b-4b80-a49d-9585a31aefff" width="200" title="Polylines"/>

A new Flutter project.

## Getting Started

## Folder Structure


```
lib
│
├── Component => This file contains the component
│   ├── ScreenNameComponent Folder
│   │   [Contains all the components For Particular Screen]
│   │       │
│   └──CommonComponet [Folder]
│             [ Contains Widget like button, search bar, textfield... etc ]
│       
│
├── Config => The file contains the configuration file that used main.dart
│   ├── routes 🛣️
│   │       │
│   │       ├── app_routes
│   │       │   [Contains all the routes used in main.dart ]
│   │       │   
│   │       └── route_path
│   │           [ Class to add all the routes, which can be fetched using class ]
│   ├── theme 💄
│   │       │
│   │       ├── theme_collection
│   │       │   [Collection of Themes like dark, light, etc ]
│   │       │   
│   │       ├── abstract_theme
│   │       │   [ Abstract class of theme which will be extended by different theme used ]
│   │       │
│   │       ├── my_theme
│   │       │    [ Current theme setup ]
│   │       │
│   │       └── theme_manager
│   │           [ Method to select theme ]
│   │
│   ├── app_init.dart ⚙️
│   │
│   ├── r.dart 🎞️
│   │   [ Contains Assets path ]
│   │
│   └── text_styles.dart
│       [ Contains all the textStyle used in the App ]
│
├── Constant
│   ├──font_constant
│   │       [ Constant of Fonts that are used in the app ]
│   ├── enum
│   └──string constant
│    
├── Cors
│   ├── common_utils
│   │   [ This file will have the methods to display snackbar, dialogue, etc ]
│   │
│   ├── ApisRoutes
│   │  
│   ├── Api Wrapper
│   │
│   ├── 
│   │ 
│   ├──Other Services
│   └── Shared Prefrance
│ 
├── L10N [Language]
│
├── Screens 🪶 [Folder]
│   └── ScreenName [Folder]
│       │
│       └── screen_name.dart[file in snake_case] 
│          │
│          If contain tab => Another folder with tab_name_screen => Under Screen Name
│
├── Model 💃
│   └── Contains All the Model
│        [ Model for the language ]
│
└── main.dart 🚀
    [Project begins Here]

```



```
Git branch

** developer [From Where Developer will pull and raise PR]
** staging   [ Parallel branch to main]
** main      [ Stable which will not be touched by anyone]

```


Build DEV APK
```
flutter build apk --release --build-name=flutter_goole_map_1.0.1 --build-number=1
```

Build PROD APK
```
flutter build apk --release --build-name=flutter_goole_map_1.0.1 --build-number=1
```

Increase the patch version with every build


Share build
```
Create the build from above Command

Upload the build in this folder
https://drive.google.com/drive/folders/1-DwyW8LEWT6fIOWEVTiLORfSHWLPk0mu?usp=sharing

Rename the build like this nepal_calender_dev_version_no

Share the build Link
```


Common Rules
```
Folder name: Folder name should be camelCase, like FolderName
File name: File name should be snake_case, like home_screen.dart
Class Name: Class Name should be camelCase, like ClassName
Fuction Name: Function name should be like this thisIsFuction(){}
```

Remove these from git cache 
```
 git rm -r --cached android/local.properties
```
```
git rm -r --cached .idea
```
```
git rm -r --cached .dart_tool
```
```
git rm -r --cached .flutter-plugins
```
```
git rm -r --cached .flutter-plugins-depende
```


Set Upsetream
```
git config --global --add --bool push.autoSetupRemote true
```
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/flutter_google_map/count.svg" alt ="Loading">
