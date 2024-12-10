const { Pool } = require('pg');

const getCustomerByDocument = (document) =>
	`SELECT * FROM public."customer" WHERE cpf = '${document}'`;

const pool = new Pool({
	user: process.env.USER,
	host: process.env.HOST,
	database: process.env.DATABASE,
	password: process.env.PASSWORD,
	port: process.env.PORT,
	ssl: {
		rejectUnauthorized: false,
	},
});

exports.handler = async (event) => {
	let client;
	try {
		client = await pool.connect();

		if (!event?.body?.document) {
			const error = new Error('Invalid document');
			error.statusCode = 400;
			throw error;
		}

		const res = await client.query(getCustomerByDocument(event.body.document));

		return {
			statusCode: 200,
			headers: {
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*',
			},
			body: JSON.stringify(res.rows),
		};
	} catch (error) {
		return {
			statusCode: error.statusCode || 500,
			headers: {
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*',
			},
			body: JSON.stringify({
				message: error.message || 'Error when trying to get customer',
				error: error.code,
			}),
		};
	} finally {
		if (client) {
			client.release();
		}
	}
};
