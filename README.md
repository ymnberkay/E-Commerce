# E-Commerce Application

## General Information

**Application Name**: E-Commerce  
**Developer**: Berkay Yaman  
**Purpose**: An e-commerce application that allows users to shop online.

### Technologies Used:
- **SwiftUI**: UI development
- **MVVM**: Architectural pattern
- **Firebase Authentication & Firestore**: Authentication and data management
- **Mocky API**: JSON data integration
- **Alamofire**: Network request management
- **Kingfisher**: Image loading and caching

---

## Architecture and Technologies

### MVVM Architecture:
- **Model**: Represents the application's data structures.
- **ViewModel**: Handles data processing and business logic.
- **View**: Creates the user interface and displays data from the ViewModel.

### Third-Party Libraries Used:
- **Alamofire**: Used for HTTP requests and API integration.
- **Firebase**: Provides user authentication and data storage.
- **Kingfisher**: Handles image loading and caching.

---

## API and Data Management

### Mocky API Usage:
- **Mocky** provides JSON-based data.
- API responses are fetched using **Alamofire** and processed within the **ViewModel** before being displayed in **Views**.
- **Mock Data**
```json
{
  "products": [
    {
      "id": 1,
      "name": "Sony WH-1000XM5",
      "price": 349.99,
      "views": 1523,
      "rating": 4.8,
      "image": "https://productimages.hepsiburada.net/s/240/424-600/110000223938780.jpg/format:webp"
    },
    {
      "id": 2,
      "name": "Apple AirPods Pro (2. Nesil)",
      "price": 249.99,
      "views": 4321,
      "rating": 4.7,
      "image": "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/0003-layer-3_large.jpg"
    }
  ]
}
```

### Firebase Authentication & Firestore:
- User login and registration are handled using **Firebase Authentication**.
- User-related data is stored in the **Firestore** database.

---

## Installation and Setup

### Requirements:
- **Xcode 15+**
- **Swift 5+**
- **Swift Package Manager**

### Steps:
#### 1. Clone the project from GitHub:

```bash
git clone https://github.com/ymnberkay/E-Commerce.git

```

#### 2. Create a Firebase project and add the GoogleService-Info.plist file to your project.
- Follow Firebase setup instructions to create a new Firebase project.
- Download the GoogleService-Info.plist from your Firebase console and add it to your Xcode project.
#### 3.Install dependencies using Swift Package Manager in Xcode:
- In Xcode, go to File > Swift Packages > Add Package Dependency.
- Add the necessary dependencies (such as Alamofire, Firebase, and Kingfisher) from their respective repositories.
#### 4.Open the project in Xcode and run the application.
