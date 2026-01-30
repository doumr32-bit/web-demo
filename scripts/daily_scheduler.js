#!/usr/bin/env node

/**
 * MoltBot Daily Scheduler
 * Orchestrates daily tasks: log collection, tutorial search, and tool discovery
 */

const LogCollector = require('./log_collector');
const TutorialFinder = require('./tutorial_finder');
const ToolDiscoverer = require('./tool_discoverer');

class DailyScheduler {
  constructor() {
    this.logCollector = new LogCollector();
    this.tutorialFinder = new TutorialFinder();
    this.toolDiscoverer = new ToolDiscoverer();
  }

  /**
   * Run all daily tasks
   */
  async runDailyTasks() {
    console.log('Starting daily MoltBot tasks...');
    
    try {
      // Collect logs
      console.log('Collecting logs...');
      await this.logCollector.collectLogs();
      
      // Find tutorials
      console.log('Searching for tutorials...');
      await this.tutorialFinder.searchTutorials();
      
      // Discover tools
      console.log('Discovering tools...');
      await this.toolDiscoverer.discoverTools();
      
      console.log('All daily tasks completed successfully!');
      
      // Return summary
      return {
        timestamp: new Date().toISOString(),
        status: 'success',
        tasks: {
          logs: 'completed',
          tutorials: 'completed',
          tools: 'completed'
        }
      };
    } catch (error) {
      console.error('Daily tasks failed:', error);
      throw error;
    }
  }

  /**
   * Run a specific task
   */
  async runTask(taskName) {
    switch(taskName) {
      case 'logs':
        return await this.logCollector.collectLogs();
      case 'tutorials':
        return await this.tutorialFinder.searchTutorials();
      case 'tools':
        return await this.toolDiscoverer.discoverTools();
      default:
        throw new Error(`Unknown task: ${taskName}`);
    }
  }
}

// If running directly
if (require.main === module) {
  const scheduler = new DailyScheduler();
  
  // Run all daily tasks
  scheduler.runDailyTasks()
    .then(result => {
      console.log('Daily scheduler completed:', result);
    })
    .catch(err => {
      console.error('Daily scheduler failed:', err);
      process.exit(1);
    });
}

module.exports = DailyScheduler;