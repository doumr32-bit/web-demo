#!/usr/bin/env node

/**
 * MoltBot Log Collector
 * Collects MoltBot operation logs and saves them in a structured format
 */

const fs = require('fs');
const path = require('path');

class LogCollector {
  constructor() {
    this.logsDir = path.join(__dirname, '../data/logs');
    this.ensureDirectories();
  }

  ensureDirectories() {
    if (!fs.existsSync(this.logsDir)) {
      fs.mkdirSync(this.logsDir, { recursive: true });
    }
  }

  /**
   * Collect logs from MoltBot instance
   */
  async collectLogs() {
    try {
      // This would normally connect to your MoltBot instance
      // For now, we'll simulate log collection
      const timestamp = new Date().toISOString();
      
      // Simulated log entry
      const logEntry = {
        timestamp,
        level: 'INFO',
        component: 'MoltBot',
        message: 'Daily log collection initiated',
        details: {
          source: 'simulated',
          eventType: 'daily_collection'
        }
      };

      // Save to daily log file
      const dateStr = new Date().toISOString().split('T')[0];
      const logFilePath = path.join(this.logsDir, `${dateStr}.json`);
      
      let existingLogs = [];
      if (fs.existsSync(logFilePath)) {
        const content = fs.readFileSync(logFilePath, 'utf8');
        existingLogs = JSON.parse(content);
      }
      
      existingLogs.push(logEntry);
      
      fs.writeFileSync(logFilePath, JSON.stringify(existingLogs, null, 2));
      
      console.log(`Collected log entry for ${dateStr}`);
      return logEntry;
    } catch (error) {
      console.error('Error collecting logs:', error);
      throw error;
    }
  }

  /**
   * Get logs for a specific date range
   */
  getLogs(fromDate, toDate) {
    const logs = [];
    const start = new Date(fromDate);
    const end = new Date(toDate || new Date());
    
    let currentDate = new Date(start);
    while (currentDate <= end) {
      const dateStr = currentDate.toISOString().split('T')[0];
      const logFilePath = path.join(this.logsDir, `${dateStr}.json`);
      
      if (fs.existsSync(logFilePath)) {
        const content = fs.readFileSync(logFilePath, 'utf8');
        const dailyLogs = JSON.parse(content);
        logs.push(...dailyLogs);
      }
      
      currentDate.setDate(currentDate.getDate() + 1);
    }
    
    return logs;
  }
}

module.exports = LogCollector;

// If running directly
if (require.main === module) {
  const collector = new LogCollector();
  collector.collectLogs()
    .then(result => {
      console.log('Log collection completed:', result);
    })
    .catch(err => {
      console.error('Log collection failed:', err);
    });
}