#!/usr/bin/env node

/**
 * Update API endpoints with latest data
 * This script copies data from the data/ directory to the api/ directory
 */

const fs = require('fs');
const path = require('path');

class ApiUpdater {
  constructor() {
    this.dataDir = path.join(__dirname, '../data');
    this.apiDir = path.join(__dirname, '../api');
  }

  async updateApiEndpoints() {
    console.log('Updating API endpoints with latest data...');
    
    // Ensure API directory exists
    if (!fs.existsSync(this.apiDir)) {
      fs.mkdirSync(this.apiDir, { recursive: true });
    }
    
    // Process logs
    await this.updateLogs();
    
    // Process tutorials
    await this.updateTutorials();
    
    // Process tools
    await this.updateTools();
    
    console.log('API endpoints updated successfully!');
  }

  async updateLogs() {
    try {
      // Get the latest logs file
      const logsDir = path.join(this.dataDir, 'logs');
      const files = fs.readdirSync(logsDir);
      if (files.length > 0) {
        // Sort files and get the most recent one
        const sortedFiles = files.sort().reverse();
        const latestLogFile = sortedFiles[0];
        const latestLogPath = path.join(logsDir, latestLogFile);
        
        // Read the log data
        const logData = JSON.parse(fs.readFileSync(latestLogPath, 'utf8'));
        
        // Create API response
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          logs: logData
        };
        
        // Write to API endpoint
        const outputPath = path.join(this.apiDir, 'logs.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        
        console.log(`Updated logs API with data from ${latestLogFile}`);
      } else {
        // Create empty response if no logs exist
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          logs: []
        };
        
        const outputPath = path.join(this.apiDir, 'logs.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        console.log('Created empty logs API response');
      }
    } catch (error) {
      console.error('Error updating logs API:', error);
      throw error;
    }
  }

  async updateTutorials() {
    try {
      // Get the latest tutorials file
      const tutorialsDir = path.join(this.dataDir, 'tutorials');
      const files = fs.readdirSync(tutorialsDir);
      if (files.length > 0) {
        // Sort files and get the most recent one
        const sortedFiles = files.sort().reverse();
        const latestTutorialFile = sortedFiles[0];
        const latestTutorialPath = path.join(tutorialsDir, latestTutorialFile);
        
        // Read the tutorial data
        const tutorialData = JSON.parse(fs.readFileSync(latestTutorialPath, 'utf8'));
        
        // Create API response
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          tutorials: tutorialData
        };
        
        // Write to API endpoint
        const outputPath = path.join(this.apiDir, 'tutorials.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        
        console.log(`Updated tutorials API with data from ${latestTutorialFile}`);
      } else {
        // Create empty response if no tutorials exist
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          tutorials: []
        };
        
        const outputPath = path.join(this.apiDir, 'tutorials.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        console.log('Created empty tutorials API response');
      }
    } catch (error) {
      console.error('Error updating tutorials API:', error);
      throw error;
    }
  }

  async updateTools() {
    try {
      // Get the latest tools file
      const toolsDir = path.join(this.dataDir, 'tools');
      const files = fs.readdirSync(toolsDir);
      if (files.length > 0) {
        // Sort files and get the most recent one
        const sortedFiles = files.sort().reverse();
        const latestToolFile = sortedFiles[0];
        const latestToolPath = path.join(toolsDir, latestToolFile);
        
        // Read the tool data
        const toolData = JSON.parse(fs.readFileSync(latestToolPath, 'utf8'));
        
        // Create API response
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          tools: toolData
        };
        
        // Write to API endpoint
        const outputPath = path.join(this.apiDir, 'tools.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        
        console.log(`Updated tools API with data from ${latestToolFile}`);
      } else {
        // Create empty response if no tools exist
        const apiResponse = {
          lastUpdated: new Date().toISOString(),
          tools: []
        };
        
        const outputPath = path.join(this.apiDir, 'tools.json');
        fs.writeFileSync(outputPath, JSON.stringify(apiResponse, null, 2));
        console.log('Created empty tools API response');
      }
    } catch (error) {
      console.error('Error updating tools API:', error);
      throw error;
    }
  }
}

// If running directly
if (require.main === module) {
  const updater = new ApiUpdater();
  updater.updateApiEndpoints()
    .then(() => {
      console.log('API update completed successfully!');
    })
    .catch(err => {
      console.error('API update failed:', err);
      process.exit(1);
    });
}

module.exports = ApiUpdater;