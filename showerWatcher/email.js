
const config = require('config')
const sgMail = require('@sendgrid/mail');

sgMail.setApiKey(config.get('sendgrid_api_key'))

const msg = {
  to: 'ryan.stille@gmail.com',
  from: 'showers@stillnet.org', // Use the email address or domain you verified above
  subject: 'Test email about the shower',
  text: 'This is my test 2',
  html: '<strong>this</strong> is my test 2',
};
(async () => {
  try {
    await sgMail.send(msg);
  } catch (error) {
    console.error(error);
 
    if (error.response) {
      console.error(error.response.body)
    }
  }
})();
