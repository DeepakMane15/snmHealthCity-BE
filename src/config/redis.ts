// src/config/redisClient.ts

import Redis from 'ioredis';

// Create a Redis client
const redisClient = new Redis({
    host: 'localhost',  // Default host
    port: 6379           // Default port
});

redisClient.on('error', (err) => {
    console.error('Redis error:', err);
});

export default redisClient;
