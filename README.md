# FriendFace 👥👥

A SwiftUI social networking app that demonstrates modern iOS development practices with SwiftData integration. This app showcases efficient data handling through REST API integration, persistent storage management, and a fluid user interface featuring custom layouts.

## App Preview

<div align="left">
  <p float="left">
    <img src="/FriendFace/Screenshot/user-list.png" width="250" alt="User List" />
    <img src="/FriendFace/Screenshot/user-detail-01.png" width="250" alt="User Detail 01" />
    <img src="/FriendFace/Screenshot/user-detail-02.png" width="250" alt="User Detail 02" />
  </p>
</div>

## Features

### Elegant User Interface

The app provides a clean and intuitive interface for managing social connections. When users first launch the app, they are presented with a beautifully organized list of their network connections. Each connection displays a clear activity status indicator, making it easy to see who is currently online. The interface uses thoughtful spacing and typography to ensure optimal readability and accessibility.

### Comprehensive User Profiles

Each user profile serves as a detailed digital identity card, presenting all relevant information in an organized and visually appealing manner. The profiles include personal information such as name, age, and company affiliation. Users can quickly see if someone is active on the platform through clear status indicators. Contact details and address information are readily available for connecting outside the platform. The profile also features a personal bio section where users can express themselves and share their story.

A particularly innovative feature is the tag system, which allows users to showcase their interests and characteristics through a flowing, dynamic tag display. These tags create an at-a-glance understanding of each user's personality and interests. The connected friends list provides quick access to expanding one's network through mutual connections.

### Custom Flow Layout

One of the most distinctive features of FriendFace is its implementation of a custom flow layout system. This sophisticated layout engine provides an optimal viewing experience across all devices and content quantities. The layout automatically adapts to different screen sizes, wrapping content naturally when needed while maintaining consistent spacing between elements. This creates a harmonious visual presentation that enhances the user experience.

### Data Management

FriendFace leverages the latest in Swift data handling capabilities to ensure a smooth and reliable experience. The app seamlessly integrates with SwiftData for persistent storage, ensuring that user data is always available even offline. The network operations are handled efficiently using modern async/await patterns, providing a responsive experience while fetching and updating data.

## Requirements

The application requires:
- iOS 17.0 or later
- Xcode 15.0 or later
- Swift 5.9 or later

## Installation

1. Clone the repository from GitHub
2. Open the project in Xcode
3. Build and run the application on your iOS device or simulator

## Architecture

FriendFace is built on modern iOS development principles that prioritize maintainability and performance:

The application follows the MVVM (Model-View-ViewModel) architecture pattern, ensuring a clean separation of concerns. Data persistence is handled efficiently through SwiftData, providing robust storage capabilities. The user interface is built with custom view components that enhance reusability and maintain consistency throughout the app. Network operations are implemented using efficient async/await patterns, ensuring smooth data synchronization.

## Future Enhancements

We are actively working on several exciting features for future releases:

- A comprehensive direct messaging system to facilitate private communications
- Enhanced profile customization options for more personalized user expression
- Advanced friend searching capabilities with filtered results
- An engaging activity feed to track network updates
- Push notifications for important interactions
- Profile sharing capabilities for expanding networks

## Contributing

We welcome contributions from the developer community to make FriendFace even better. Whether you're fixing bugs, improving documentation, or adding new features, your help is appreciated. Please feel free to submit pull requests or open issues for discussion.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

We extend our gratitude to:
- The SwiftUI framework for enabling modern iOS development
- SwiftData for robust data persistence capabilities
- Hacking with Swift for providing the sample API
- The iOS development community for continuous inspiration and support
