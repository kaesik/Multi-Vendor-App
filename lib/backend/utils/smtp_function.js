const nodemailer = require('nodemailer');

async function sendEmail(userEmail, message) {
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.AUTH_EMAIL,
            pass: process.env.AUTH_PASSWORD,
        },
    });

    const mailOptions = {
        from: process.env.AUTH_EMAIL,
        to: userEmail,
        subject: 'Multi Vendor App Verification Code',
        text: message,
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log('Email sent');
    } catch (e) {
        console.log('Error: ', e);
    }
}

module.exports = sendEmail;