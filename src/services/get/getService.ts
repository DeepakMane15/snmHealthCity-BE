import db from "../../db/knex"; // Adjust path to knex.ts


const GetMethod = async (input :any) => {
    let res = [];

    if (input.type === '1') {
        res = await db('snm_driver')
            .select('*', db.raw('CONCAT(first_name, " ", last_name) AS full_name'))
            .where('is_active', 1)
            .orderBy('id', 'desc');
    }
    else if (input.type === '2') {
        res = await db('vehicle as v')
            .select('v.*', 'a.reading', 'a.total_fuel')
            .leftJoin('snm_vehicle_average as a', 'a.vehicle', 'v.id')
            .where('v.is_active', 1)
            .groupBy('v.id')
            .orderBy('v.id', 'desc');
    }
    else if (input.type === '3') {
        res = await db('snm_fuel_inward')
            .select('*')
            .orderBy('id', 'desc');
    }
    else if (input.type === '4') {
        res = await db('impressed_ac as i')
            .select('i.*', 'v.registeration_no', db.raw('CONCAT(d.first_name, " ", d.last_name) AS driver_full_name'))
            .join('vehicle as v', 'v.id', 'i.vehicle_no')
            .join('snm_driver as d', 'd.id', 'i.driver_name')
            .modify(queryBuilder => {
                if (input.driver_id) {
                    queryBuilder.where('driver_name', input.driver_id);
                }
            })
            .groupBy('i.id')
            .orderBy('i.id', 'desc');
    }
    else if (input.type === '5') {
        res = await db('snm_vehicle_inout as s')
            .select('s.*', 'v.registeration_no', db.raw('CONCAT(d.first_name, " ", d.last_name) AS driver_name'))
            .join('vehicle as v', 's.vehicle_id', 'v.id')
            .join('snm_driver as d', 's.driver_id', 'd.id')
            .orderBy('s.id', 'desc');
    }
    else if (input.type === '6') {
        res = await db('snm_prerequest')
            .select('*')
            .orderBy('id', 'desc');
    }
    else if (input.type === '7') {
        res = await db('snm_spareparts as i')
            .select('i.*', 'v.registeration_no')
            .join('vehicle as v', 'v.id', 'i.vehicle')
            .groupBy('i.id')
            .orderBy('i.id', 'desc');
    }
    else if (input.type === '8') {
        res = await db('snm_vehicle_inout')
            .select('*')
            .where('vehicle_id', input.vehicle)
            .orderBy('id', 'desc')
            .limit(1);
    }
    else if (input.type === '9') {
        res = await db('snm_pollution as i')
            .select('i.*', 'v.registeration_no')
            .join('vehicle as v', 'v.id', 'i.vehicle')
            .groupBy('i.id')
            .orderBy('i.id', 'desc');
    }
    else if (input.type === '10') {
        res = await db
            .select(
                db.raw('(SELECT COUNT(id) FROM snm_driver) AS count_driver'),
                db.raw('(SELECT COUNT(id) FROM vehicle) AS count_vehicle'),
                db.raw('(SELECT COUNT(id) FROM snm_prerequest) AS count_request'),
                db.raw('(SELECT SUM(fuel_in_litre) FROM snm_fuel_inward) AS count_fuel')
            );
    }

    return res;
};

const GetByIdMethod = async (input: any) => {
    let res;

    if (input.type === '1') {
        res = await db('snm_driver')
            .where({ is_active: 1, id: input.id })
            .first();
    } 
    else if (input.type === '2') {
        res = await db('vehicle')
            .where({ is_active: 1 });
    } 
    else if (input.type === '3') {
        res = await db('snm_fuel_inward')
            .select('*');
    } 
    else if (input.type === '4') {
        res = await db('impressed_ac')
            .select('*');
    } 
    else if (input.type === '5') {
        res = await db('snm_vehicle_inout')
            .select('*');
    } 
    else if (input.type === '6') {
        res = await db('snm_prerequest')
            .select('*');
    } 
    else if (input.type === '7') {
        res = await db('snm_spareparts')
            .select('*');
    } 
    else if (input.type === '8') {
        res = await db('snm_fuel_inward')
            .where({ refill_to: input.vehicle });
    } 
    else if (input.type === '9') {
        res = await db('snm_spareparts')
            .where({ vehicle: input.vehicle });
    } 
    else if (input.type === '10') {
        const id = input.isVehicle === '0' ? input.driver : input.vehicle;
        
        res = await db('snm_vehicle_inout as v')
            .select(
                'v.*',
                'vh.registeration_no',
                db.raw('CONCAT(d.first_name, " ", d.last_name) as driver_name')
            )
            .join('snm_driver as d', 'd.id', 'v.driver_id')
            .join('vehicle as vh', 'vh.id', 'v.vehicle_id')
            .modify(queryBuilder => {
                if (input.isVehicle === '1') {
                    queryBuilder.where('v.vehicle_id', id);
                } else {
                    queryBuilder.where('v.driver_id', id);
                }
            })
            .groupBy('v.id');
    }

    // Return array if types are 8, 9, or 10
    if (input.type === '8' || input.type === '9' || input.type === '10') {
        return res;
    }

    // Otherwise return the first element
    return res[0];
};

export default { GetMethod, GetByIdMethod };
