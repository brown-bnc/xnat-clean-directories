import sys
import smtplib
from email.message import EmailMessage
import logging

logging.basicConfig(level=logging.INFO)

SMTP_USER = "bnc-it@brown.edu"
#TO_EMAIL = ["bnc-it@brown.edu", "camilo_diaz@brown.edu"]
TO_EMAIL = "camilo_diaz@brown.edu"

file_list = sys.argv[1:]

if not file_list:
    logging.info("No files to report. Email not sent.")
    sys.exit(0)


body = "The following directories contain files older than 1 day:\n\n"
body += "Size\tPath\n"
body += "----\t----\n"
for line in file_list:
    if ' ' in line:
        size, path = line.split(' ', 1)
        body += f"{size}\t{path.strip()}\n"
    else:
        body += f"{line}\n"


msg = EmailMessage()
msg['Subject'] = 'File Cleanup Report'
msg['From'] = SMTP_USER
#msg['To'] =  ', '.join(TO_EMAIL)
msg['To'] =  TO_EMAIL
msg.set_content(body)

try:
    with smtplib.SMTP("regmail.brown.edu", 25) as server:
        logging.info(server.ehlo())
        server.send_message(msg)
    logging.info("Email sent successfully.")
except Exception as e:
    logging.error(f"Failed to send email {e}", exc_info=True)
