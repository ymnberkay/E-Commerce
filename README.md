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
- **Mock Data(Products)**
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
- **Mock Data(Product Detail)**

```json
{
  "product": {
    "id": 1,
    "name": "Sony WH-1000XM5",
    "price": 349.99,
    "currency": "USD",
    "views": 1523,
    "rating": 4.8,
    "images": [
      "https://productimages.hepsiburada.net/s/240/424-600/110000223938780.jpg/format:webp",
      "https://example.com/sony-wh-1000xm5-side-view.jpg",
      "https://example.com/sony-wh-1000xm5-top-view.jpg"
    ],
    "reviews": [
      {
        "username": "john_doe",
        "rating": 5,
        "comment": "Amazing sound quality and noise cancellation!",
        "date": "2025-03-25",
        "images": [
          "https://example.com/review-image1.jpg",
          "https://example.com/review-image2.jpg"
        ]
      },
      {
        "username": "jane_smith",
        "rating": 4,
        "comment": "Comfortable to wear, but a bit expensive.",
        "date": "2025-03-24",
        "images": []
      }
    ],
    "relatedProducts": [
      {
        "id": 2,
        "name": "Bose QuietComfort 45",
        "price": 329.99,
        "currency": "USD",
        "image": "https://example.com/bose-qc45.jpg"
      },
      {
        "id": 3,
        "name": "Apple AirPods Max",
        "price": 499.99,
        "currency": "USD",
        "image": "https://example.com/airpods-max.jpg"
      }
    ]
  }
}

```


### Firebase Authentication & Firestore:
- User login and registration are handled using **Firebase Authentication**.
- User-related data is stored in the **Firestore** database.

---
## Screenshots

<img src="https://github.com/user-attachments/assets/25e84486-bb19-4694-ad07-4d149745187f" alt="Login" width="400">
<img src="https://github.com/user-attachments/assets/e7972737-a0a6-43bd-93fa-01344a2d1f09" alt="Signup" width="400">
<img src="https://github.com/user-attachments/assets/d914fb71-5778-4f16-9d0a-3aa06d41b264" alt="Home" width="400">
<img src="https://github.com/user-attachments/assets/815f62a5-bf06-4779-97c1-0600f91c2980" alt="Detail" width="400">
<img src="https://github.com/user-attachments/assets/cd2eea63-200d-46dc-ad65-0a649a7f192b" alt="Profile" width="400">
<img src="https://github.com/user-attachments/assets/a0a1dc20-5de3-4d30-a339-fda2b1453e90" alt="Shopping" width="400">
<img src="https://github.com/user-attachments/assets/f1941b7a-36d1-43ee-a33b-5d0fc8d15d82" alt="AllData" width="400">

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
