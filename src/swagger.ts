import swaggerJsdoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';

// Define options for swagger-jsdoc
const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Sadhsangat API',
            version: '1.0.0',
            description: 'API documentation for the Sadhsangat application',
        },
        servers: [
            {
                url: 'http://localhost:3200/api',
                description: 'Development server',
            },
        ],
    },
    // Paths to the API docs
    apis: ['./src/routes/*.ts'], // Adjust path based on your file structure
};

// Initialize swagger-jsdoc
const swaggerSpec = swaggerJsdoc(swaggerOptions);

export { swaggerSpec, swaggerUi };
