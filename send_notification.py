import sys
import smtplib,ssl
from email.message import EmailMessage
import logging

logging.basicConfig(level=logging.INFO)

SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 465
SMTP_USER = "bnc-it@brown.edu"
SMTP_PASS = "mirgi2-huJwor-tekboz"
TO_EMAIL = "camilo_diaz@brown.edu"


# file_list = sys.argv[1:]
# body = "The following files are older than 1 day:\n\n" + "\n".join(file_list)

msg = EmailMessage()
msg['Subject'] = 'Test Email'
msg['From'] = SMTP_USER
msg['To'] = TO_EMAIL
msg.set_content('This is a test email sent from an authenticated Python script.')

# send the email
email_text = 'This is a test email sent from a Python script!'
try:
    # with smtplib.SMTP('regmail.brown.edu:25') as server:
    #     #server.ehlo()
    #     #server.starttls()
    #     server.sendmail(SMTP_USER, TO_EMAIL ,email_text)
    #     server.quit()
    # print("Notification email sent successfully.")
    with smtplib.SMTP("regmail.brown.edu", 25) as server:
        logging.info(server.ehlo())
        # server.starttls(context=ssl.create_default_context())
        # server.login(SMTP_USER, SMTP_PASS)
        server.send_message(msg)
    logging.info("Email sent successfully.")
except Exception as e:
    logging.error(f"Failed to send email {e}", exc_info=True)
