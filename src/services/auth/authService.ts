import db from "../../db/knex"; // Adjust path to knex.ts

const isEmail = (userName: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(userName);
};

const isNumber = (userName: string): boolean => {
  return /^\d+$/.test(userName);
};

const signin = async (userName: string, password: string) => {
  // Validation: Ensure username and password are not undefined or null
  if (!userName || !password) {
    throw new Error("Username or password is undefined");
  }

  // Build the query
  let query = db("common_user_login")
    .select("*", db.raw("user_type as type"))
    .where("password", password);

  // if (isEmail(userName)) {
    query = query.andWhere("username", userName);
  // } else if (isNumber(userName)) {
  //   query = query.andWhere("cell_number", userName);
  // }

  // Return the first result
  return await query.first();
};

const getPermission = async(userId: number) => {
  let res = await db('user_permissions as u')
  .select('u.title', 'u.canEdit')
  .innerJoin('common_user_login as c', 'c.id', 'u.user_id')
  .where('c.id', userId);

  return res;
}

export default { signin, getPermission };
