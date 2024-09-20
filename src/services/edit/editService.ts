import db from "../../db/knex"; // Adjust path to knex.ts

const editMethod = async (input: any) => {
    let res;
    let data: any = {};

    if (input.type === '1') {
        // Update in 'impressed_ac' table
        data = {
            vehicle_no: input.vehicle_no,
            driver_name: input.driver_name,
            expense_for: input.expense_for,
            last_reading: input.last_reading,
            rate: input.rate,
            qty: input.qty,
            is_challan: input.is_challan,
            challan_type: input.challan_type,
            other_challan: input.other_challan,
            amount: input.amount,
            date: input.date,
            payment_mode: input.payment_mode
        };
        res = await db('impressed_ac').update(data).where({ id: input.id });
    }
    else if (input.type === '2') {
        // Update in 'snm_driver' table
        data = {
            sewadar_code: input.sewadar_code,
            first_name: input.fname,
            last_name: input.lname,
            dl_no: input.dl,
            phone: input.phone,
            department: input.department,
            address: input.address,
            emergency_no: input.eNo,
            emergency_name: input.eName,
            insurance: input.insurance ? 1 : 0,
            insurance_date: input.iDate,
            fuel_card_issued: input.fuel_card ? 1 : 0,
            fuel_card_no: input.fNo,
            fuel_card_make: input.fuel_card_make,
            cash_eligiblity: input.cashElg ? 1 : 0,
            cash_limit: input.cLimit,
            type: input.sewadar_type
        };
        res = await db('snm_driver').update(data).where({ id: input.id });
    }
    else if (input.type === '3') {
        // Update in 'vehicle' table
        data = {
            chassis_no: input.chassis_no,
            registeration_no: input.registeration_no,
            engine_no: input.engine_no,
            manufacturing_date: input.manufacturing_date,
            sitting_capacity: input.sitting_capacity,
            model_name: input.model_name,
            vehicle_make: input.vehicle_make,
            purchase_date: input.purchase_date,
            registeration_date: input.registeration_date,
            fuel_type: input.fuel_type,
            registeration_validity: input.registeration_validity,
            present_km: input.present_km
        };
        res = await db('vehicle').update(data).where({ id: input.id });
    }
    else if (input.type === '4') {
        // Update in 'snm_spareparts' table
        data = {
            vehicle: input.vehicle,
            part: input.part,
            desc: input.desc,
            date: input.date,
            amount: input.amount
        };
        res = await db('snm_spareparts').update(data).where({ id: input.id });
    }
    else if (input.type === '5') {
        // Update in 'snm_fuel_inward' table
        data = {
            receipt_no: input.receipt_no,
            fuel_in_litre: input.fuel_in_litre,
            rate: input.rate,
            amount: input.amount,
            amount_paid: input.amount_paid,
            transaction_type: input.transaction_type,
            refill_from: input.refill_from,
            refill_to: input.vehicle,
            present_km: input.present_km
        };
        res = await db('snm_fuel_inward').update(data).where({ id: input.id });

        // Update vehicle average logic
        const recent = await db('snm_vehicle_average').where({ vehicle: input.vehicle }).first();
        let km = input.present_km;
        let fuel = input.fuel_in_litre;

        if (recent) {
            if (km > recent.reading) {
                km += recent.reading;
                fuel += recent.total_fuel;

                const avg = { vehicle: input.vehicle, reading: km, total_fuel: fuel };
                res = await db('snm_vehicle_average').update(avg).where({ vehicle: input.vehicle });
            }
        } else {
            const avg = { vehicle: input.vehicle, reading: km, total_fuel: fuel };
            res = await db('snm_vehicle_average').insert(avg);
        }
    }
    else if (input.type === '6') {
        // Update in 'snm_prerequest' table
        data = {
            name: input.name,
            date: input.date,
            time: input.time,
            pickup: input.pickup,
            phone: input.phone,
            mode: input.mode,
            destination: input.destination
        };
        res = await db('snm_prerequest').update(data).where({ id: input.id });
    }
    else if (input.type === '7') {
        // Update in 'snm_vehicle_inout' table
        data = {
            vehicle_id: input.vehicle,
            driver_id: input.driver,
            type: input.markType,
            km: input.km,
            request: input.request
        };
        res = await db('snm_vehicle_inout').update(data).where({ id: input.id });

        if (res) {
            // Mark pre-request as complete
            await db('snm_prerequest').update({ status: 'complete' }).where({ id: input.request });

            // Update vehicle average
            const recent = await db('snm_vehicle_average').where({ vehicle: input.vehicle }).first();
            let km = input.km;

            if (recent) {
                if (km > recent.reading) {
                    km += recent.reading;

                    const avg = { vehicle: input.vehicle, reading: km };
                    res = await db('snm_vehicle_average').update(avg).where({ vehicle: input.vehicle });
                }
            } else {
                const avg = { vehicle: input.vehicle, reading: km };
                res = await db('snm_vehicle_average').insert(avg);
            }
        }
    }
    else if (input.type === '8') {
        // Update in 'snm_pollution' table
        data = {
            vehicle: input.vehicle,
            type: input.addType,
            amount: input.amount,
            valid_till: input.date,
            tenure: input.tenure
        };
        res = await db('snm_pollution').update(data).where({ id: input.id });
    }
    else if (input.type === '9') {
        // Update 'snm_prerequest' status to 'pending'
        data = { status: 'pending' };
        res = await db('snm_prerequest').update(data).where({ id: input.id });
    }

    return true;
};

export default {
    editMethod
};
