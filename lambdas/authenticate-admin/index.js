const AWS = require('aws-sdk');
const cognito = new AWS.CognitoIdentityServiceProvider();

let cachedClientId = null;

const getCognitoClientId = async () => {
	if (cachedClientId) return cachedClientId;

	try {
		const userPools = await cognito.listUserPools({ MaxResults: 60 }).promise();
		const userPool = userPools.UserPools.find((pool) =>
			pool.Name.includes('tech-challenge'),
		);

		if (!userPool) throw new Error('User Pool not found');

		const clients = await cognito
			.listUserPoolClients({
				UserPoolId: userPool.Id,
				MaxResults: 60,
			})
			.promise();

		const adminClient = clients.UserPoolClients.find((client) =>
			client.ClientName.includes('admin'),
		);

		if (!adminClient) throw new Error('Admin client not found');

		cachedClientId = adminClient.ClientId;
		return cachedClientId;
	} catch (error) {
		console.error('Error fetching Cognito Client ID:', error);
		throw error;
	}
};

exports.handler = async (event) => {
	try {
		const { email, password } = JSON.parse(event.body);
		const clientId = await getCognitoClientId();

		const params = {
			AuthFlow: 'USER_PASSWORD_AUTH',
			ClientId: clientId,
			AuthParameters: {
				USERNAME: email,
				PASSWORD: password,
			},
		};

		const response = await cognito.initiateAuth(params).promise();

		return {
			statusCode: 200,
			headers: {
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*',
			},
			body: JSON.stringify({
				message: 'Authentication successful',
				tokens: {
					accessToken: response.AuthenticationResult.AccessToken,
					refreshToken: response.AuthenticationResult.RefreshToken,
					idToken: response.AuthenticationResult.IdToken,
					expiresIn: response.AuthenticationResult.ExpiresIn,
				},
			}),
		};
	} catch (error) {
		console.error('Authentication error:', error);

		return {
			statusCode: error.statusCode || 500,
			headers: {
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*',
			},
			body: JSON.stringify({
				message: error.message || 'Authentication failed',
				error: error.code,
			}),
		};
	}
};
