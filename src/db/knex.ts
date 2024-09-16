import knex from 'knex';
import knexConfig from '../../knexfile'; // Adjust path to knexfile

const db = knex(knexConfig);

export default db;
