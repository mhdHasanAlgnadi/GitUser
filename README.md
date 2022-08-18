# GitUser Documentation
[TOC]

### 1. Developer Information

Name : Mhd Hasan Al Janadi

Email : mhdhasanaljanady@gmail.com

Phone : +201050187724

To Run the Project , follow this steps

### 2. Project Configuration
#### 2.1 Clone project
- Clone the project from the repo.
- Pull the code from Master branch. 

#### 2.2 Cocoapods Install
- Open the Terminal.
  [Use the following command]
  ```bash
  sudo gem install cocoapods
  ```

#### 2.2.1 Pods Install

**Steps to run the iOS project :**
- Open the Terminal. 
  [Go to the project directory and use the following commands]
  [Use the following command]
  ```bash
  pod deintegrate
  ```
  [Go to project directory and delete **podfile.lock** and **workspace** files]
  ```bash
  pod install
  ```
  [Open **HelloFolk.xcworkspace** file with the XCode.]

### 3. Fastlane

#### 3.1 [fastlane match](https://docs.fastlane.tools/actions/match/)

This repository contains all your certificates and provisioning profiles needed to build and sign your applications. They are encrypted using OpenSSL via a passphrase.

**Important:** Make sure this repository is set to private and only your team members have access to this repo.

Do not modify this file, as it gets overwritten every time you run _match_.

#### 3.2 Fastlane Installation

Make sure you have the latest version of the Xcode command line tools installed:

```bash
xcode-select --install
```

Install _fastlane_ using

```bash
sudo gem install fastlane -NV
```

or alternatively using `brew install fastlane`

#### 3.3 Usage

Navigate to your project folder and run

```
fastlane match appstore
```

```
fastlane match adhoc
```

```
fastlane match development
```

```
fastlane match enterprise
```

For more information open [fastlane match git repo](https://docs.fastlane.tools/actions/match/)

### 3. Content

#### 3.1 Certs

This directory contains all your certificates with their private keys

#### 3.2 Profiles

This directory contains all provisioning profiles

---
For more information open [fastlane match git repo](https://docs.fastlane.tools/actions/match/)



### 4. Structure
#### 4.1 MVVM

 The [Model-View-ViewModel Pattern](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/enterprise-application-patterns/mvvm) aids in decoupling the business and presentation logic of an application from its user interface definition. It encourages re-usable and extensible code that is easier to maintain, test, and evolve.  

#### 4.2 Pattern Overview
There are three core components in the [MVVM Pattern](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/enterprise-application-patterns/mvvm):

![MVVM Illustration](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/enterprise-application-patterns/mvvm-images/mvvm.png)

**Model:**  
Encapsulates the data used by the application. It represents the domain model which can be data along with business and validation logic. These can include DTOs (data transfer objects), POCOs (plain old CLR objects), as well as generated entity or proxy objects. 

**View:**  
Represents what the user sees on the screen. A **View** is often defined separately to the code that underpins it. For example, AXML on Android, Storyboards on iOS, or XAML for UWP or Xamarin.Forms apps. A code-first approach can also be used and may be preferred. Both are valid and have their pros and cons. It is recommended that **View** related code contains only logic that implements visual behavior and does not contain any business logic.

**ViewModel:**  
Defines the functionality and data to be represented by the **View** and coordinates the **View** interactions and changes to any **Model** classes that underpin it. The **ViewModel** typically exposes **Properties** and **Commands** that both informs the state of the **View** and can be used to notify of state changes or user input. 
