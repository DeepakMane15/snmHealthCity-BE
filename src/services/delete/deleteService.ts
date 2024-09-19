import db from "../../db/knex"; // Adjust path to knex.ts


const deleteMethod = async (input :any) => {
    let res = [];

    if (input.type === '1') {
        await db('snm_driver')
        .where('id', input.id)
        .update('isDeleted',1);
    }
    else if (input.type === '2') {
        await db('vehicle')
        .where('id', input.id)
        .update('isDeleted',1);
    }
    else if (input.type === '3') {
        await db('snm_fuel_inward')
        .where('id', input.id)
        .update('isDeleted',1);
    }
    else if (input.type === '4') {
        await db('impressed_ac')
        .where('id', input.id)
        .update('isDeleted',1);
    }
    else if (input.type === '5') {
        // res = await db('snm_vehicle_inout as s')
        //     .select('s.*', 'v.registeration_no', db.raw('CONCAT(d.first_name, " ", d.last_name) AS driver_name'))
        //     .join('vehicle as v', 's.vehicle_id', 'v.id')
        //     .join('snm_driver as d', 's.driver_id', 'd.id')
        //     .orderBy('s.id', 'desc');
        return;
    }
    else if (input.type === '6') {
        await db('snm_prerequest')
        .where('id', input.id)
        .update('isDeleted',1);
    }
    else if (input.type === '7') {
        // res = await db('snm_spareparts as i')
        //     .select('i.*', 'v.registeration_no')
        //     .join('vehicle as v', 'v.id', 'i.vehicle')
        //     .groupBy('i.id')
        //     .orderBy('i.id', 'desc');
        return;
    }
    else if (input.type === '8') {
        // res = await db('snm_vehicle_inout')
        //     .select('*')
        //     .where('vehicle_id', input.vehicle)
        //     .orderBy('id', 'desc')
        //     .limit(1);
        return;
    }
    else if (input.type === '9') {
        // res = await db('snm_pollution as i')
        //     .select('i.*', 'v.registeration_no')
        //     .join('vehicle as v', 'v.id', 'i.vehicle')
        //     .groupBy('i.id')
        //     .orderBy('i.id', 'desc');
        return;
    }
    else if (input.type === '10') {
        // res = await db
        //     .select(
        //         db.raw('(SELECT COUNT(id) FROM snm_driver) AS count_driver'),
        //         db.raw('(SELECT COUNT(id) FROM vehicle) AS count_vehicle'),
        //         db.raw('(SELECT COUNT(id) FROM snm_prerequest) AS count_request'),
        //         db.raw('(SELECT SUM(fuel_in_litre) FROM snm_fuel_inward) AS count_fuel')
        //     );
        return;
    }
};

export default { deleteMethod };
