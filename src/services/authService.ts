import db from "../db/knex"; // Adjust path to knex.ts

const getUnitById = async (id: number) => {
  return await db("units_master").where({ id }).first();
};


export default { getUnitById };
