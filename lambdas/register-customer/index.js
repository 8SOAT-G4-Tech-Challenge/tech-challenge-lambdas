// register-customer/index.js
/* exports.handler = async (event) => {
  try {
    const { cpf, name, email } = JSON.parse(event.body);
    
    if (!validateCPF(cpf)) {
      return buildResponse(400, { error: 'Invalid CPF' });
    }
    
    // Save customer to database
    const customer = await createCustomer({ cpf, name, email });
    
    return buildResponse(201, { customer });
  } catch (error) {
    return buildResponse(500, { error: 'Registration failed' });
  }
}; */