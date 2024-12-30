<!DOCTYPE html>
<html lang="en">

<body>

<h1>Recipe Flutter App</h1>

<p>A Flutter-based Recipe application developed as part of a class project. The app provides users with an intuitive platform to explore, manage, and bookmark recipes, incorporating features like authentication, text-to-speech, and CRUD operations.</p>

<h2>Features</h2>
<ul>
    <li><strong>Authentication</strong>: Secure user login and registration.</li>
    <li><strong>Text-to-Speech</strong>: Listen to recipes for a hands-free experience.</li>
    <li><strong>CRUD for Recipes</strong>: Create, Read, Update, and Delete recipes seamlessly.</li>
    <li><strong>Bookmarking</strong>: Save favorite recipes for quick access.</li>
    <li><strong>Local Storage</strong>: Shared Preferences for storing user preferences locally.</li>
</ul>

<h2>Setup and Installation</h2>
<ol>
    <li><strong>Clone the Repository</strong>:  
        Clone this repository to your local machine using the following command:
        <pre><code>git clone &lt;repository-url&gt;
cd &lt;repository-folder&gt;</code></pre>
    </li>
    <li><strong>Install Dependencies</strong>:  
        Fetch all the required Flutter dependencies by running:
        <pre><code>flutter pub get</code></pre>
    </li>
    <li><strong>Run the App</strong>: 
        Run the application on your connected device or emulator with:
        <pre><code>flutter run</code></pre>
    </li>
</ol>

<h3>Additional Notes</h3>
<p>Ensure that your Flutter version matches the required version in the pubspec.yaml file. If you encounter issues, use <code>flutter doctor</code> to troubleshoot.</p>

<h2>Challenges Faced</h2>
<ul>
    <li><strong>Flutter Upgrade Issues</strong>: After upgrading Flutter, some dependencies broke due to incompatibility with the new version. The team resolved this by updating dependencies, reviewing documentation, and replacing deprecated code.</li>
    <li><strong>Text-to-Speech Integration</strong>: Managing dependencies and permissions for the text-to-speech feature across Android and iOS involved debugging and platform-specific code adjustments.</li>
    <li><strong>Shared Preferences Issues</strong>: Ensuring persistent local storage across sessions required handling default values and edge cases to maintain a smooth user experience.</li>
</ul>


<h2>SCM Practices</h2>
<p>Source Control Management (SCM) practices were pivotal in managing the project efficiently:</p>
<ul>
    <li><strong>Version Control</strong>: Git was used to maintain a clean history of changes, allowing for easy rollbacks and updates.</li>
    <li><strong>Collaboration</strong>: Hosting the project on GitHub enabled seamless collaboration. Pull requests and code reviews ensured consistent quality.</li>
    <li><strong>Branching Strategy</strong>: Feature branches were created for isolated development, preventing conflicts in the main branch.</li>
    <li><strong>Issue Tracking</strong>: GitHub Issues were used to log challenges, bugs, and enhancements, prioritizing tasks and streamlining the workflow.</li>
    <li><strong>Configuration Management</strong>: Configuration files were version-controlled, ensuring compatibility across development and production environments.</li>
</ul>

<h2>Contributing</h2>
<p>We welcome contributions to the project. To contribute:</p>
<ol>
    <li><strong>Fork the Repository</strong>: Click the Fork button on the repository page.</li>
    <li><strong>Create a New Branch</strong>: 
        <pre><code>git checkout -b feature-name</code></pre>
    </li>
    <li><strong>Make Changes</strong>: Implement your feature or fix and commit changes:
        <pre><code>git commit -m "Add your commit message here"</code></pre>
    </li>
    <li><strong>Push to Your Fork</strong>:
        <pre><code>git push origin feature-name</code></pre>
    </li>
    <li><strong>Open a Pull Request</strong>: Go to the original repository and open a pull request with your changes.</li>
</ol>

<h2>License</h2>
<p>This project is licensed under the MIT License. See the LICENSE file for more details.</p>

</body>
</html>
