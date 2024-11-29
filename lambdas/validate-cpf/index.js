// validate-cpf/index.js
/* const { validateCPF } = require('../shared/utils/cpf-validator');
const { buildResponse } = require('../shared/utils/response-builder');

exports.handler = async (event) => {
  try {
    const { cpf } = JSON.parse(event.body);
    const isValid = validateCPF(cpf);
    
    return buildResponse(200, { isValid });
  } catch (error) {
    return buildResponse(400, { error: 'Invalid input' });
  }
}; */