'use strict';
const { yup, validateYupSchema } = require('@strapi/utils')

const callbackBodySchema = yup.object().shape({
  identifier: yup.string().required(),
  password: yup.string().required(),
})

const registerBodySchema = yup.object().shape({
  first_name: yup.string().required(),
  middle_name: yup.string().notRequired(),
  surname: yup.string().required(),
  username: yup.string().required(),
  email: yup.string().required(),
  password: yup.string().required(),
  dob: yup.date().required()
})

module.exports = {
  validateCallbackBody: validateYupSchema(callbackBodySchema),
  validateRegisterBody: validateYupSchema(registerBodySchema)
}