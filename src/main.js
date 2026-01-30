// Web development test file
document.addEventListener('DOMContentLoaded', () => {
    console.log('Web development environment is ready!');
    
    // Example of modern JavaScript features
    const appDiv = document.getElementById('app');
    
    // Using modern ES6+ features
    const features = [
        'VS Code with AI assistance',
        'Modern JavaScript',
        'Web development tools',
        'Real-time editing'
    ];
    
    const featureList = document.createElement('ul');
    features.forEach(feature => {
        const listItem = document.createElement('li');
        listItem.textContent = feature;
        featureList.appendChild(listItem);
    });
    
    appDiv.appendChild(featureList);
    
    console.log('Features loaded:', features);
});